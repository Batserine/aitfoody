class BasicsController < ApplicationController
  # GET /basics
  # GET /basics.json
  # GET /basics.xml
  def quotations

    if params[:quotation]
      #category_exist
      # puts 'quotation_params'
      @quotation = Quotation.new(quotation_params)
      if @quotation.save
        flash[:notice] = 'Quotation was successfully created.'
        @quotation = Quotation.new
      end
    else
      @quotation = Quotation.new
    end
    @categories = Quotation.select("category").group(:category)
    #------ Check cookies ------------
    if  cookies[:my_quote].present?
      #--- erase my quote by using SQL : NOT IN query---
      puts 'cookies exist :'+ cookies[:my_quote]
      killed_quote_list = cookies[:my_quote].split(',')
      if params[:sort_by] == "date"
        @quotations = Quotation.where.not(id: killed_quote_list).order(:created_at)
      else
        @quotations = Quotation.where.not(id: killed_quote_list).order(:category)
      end

    else
      puts 'cookies:nil'
      if params[:sort_by] == "date"
        @quotations = Quotation.order(:created_at)
      else
        @quotations = Quotation.order(:category)
      end
    end

    puts @categories
   #----- Convert ActiveRecord to XML ----
    entries = []
    @quotations.each do |quotation|
      entry = {}
      entry.store('id', quotation.id)
      entry.store('quote', quotation.quote)
      entry.store('author_name', quotation.author_name)
      entry.store('category', quotation.category)
      entry.store('created_at', quotation.created_at)
      entry.store('updated_at', quotation.updated_at)
      entries << entry
    end
    # #----- Export Data to JSON and XML ------

    # respond_to do |format|
    #   format.html
    #   format.json { render json: @quotations }
    #   format.xml { render xml:  entries.to_xml(:root => 'quotations', children: "quotation", :skip_types => true)}
    # end
    # # render 'quotations'
  end

   #----- Export Data to JSON and XML ------

  def export_xml
    @quo= Quotation.all
    send_data @quo.as_json.to_xml.to_s
  end
  
  def export_json
    @quo= Quotation.all
    send_data @quo.to_json
  end

  def search

    #----
    if params[:term]
      # where ILIKE and where NOT IN query ID in cookies
      if  cookies[:my_quote].present?
        killed_quote_list = cookies[:my_quote].split(',')
        @quotations = Quotation.where('quote ILIKE :search OR author_name ILIKE :search',searcrah: "%#{params[:term]}%" ).where.not(id: killed_quote_list)
      else
        @quotations = Quotation.where('quote ILIKE :search OR author_name ILIKE :search',search: "%#{params[:term]}%" )
      end
    else
      if  cookies[:my_quote].present?
        killed_quote_list = cookies[:my_quote].split(',')
        @quotations = Quotation.where.not(id: killed_quote_list)
      else
        @quotations = Quotation.all
      end

    end

    init_data_form

    puts 'search here'
    render 'quotations'
  end

  def kill_quote
    quote_id = params[:id]
    #--- Collect quote_id in cookies ---
    if  cookies[:my_quote].present?
      cookies[:my_quote] = cookies[:my_quote]+','+quote_id.to_s
      puts 'add_cookies:'+cookies[:my_quote]
    else
      puts 'cookies:nil'
      cookies[:my_quote] = quote_id.to_s
    end
    #--- erase my quote by using NOT IN query---
    killed_quote_list = cookies[:my_quote].split(',')
    @quotations = Quotation.where.not(id: killed_quote_list)

    #----- Initial Data : Add New Quote -----
    init_data_form
    render 'quotations'
  end
  def init_data_form
    @quotation  = Quotation.new
    @categories = Quotation.select("category").group(:category)

  end
  # GET /destroy
  def destroy_cookies
    cookies.delete(:my_quote)
    init_data_form
    @quotations = Quotation.all
    render 'quotations'
  end


  private
  def quotationxml_params

    params.require(:quotation).permit(:author_name,:category,:quote)

  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def quotation_params

    unless params[:category_exist].nil?
      params[:quotation][:category] = params[:category_exist]
    end
    params.require(:quotation).permit(:author_name,:category,:quote)

  end


  def search_params
    params.require(:search).permit(:term)
  end
end
