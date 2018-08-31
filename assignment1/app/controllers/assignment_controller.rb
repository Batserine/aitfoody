class AssignmentController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

   # GET /projects
  # GET /projects.json
  def index

    render 'index'
  end
  def divide_by_zero
    require 'logger'

    logger = Logger.new(STDOUT)
    logger.level = Logger::WARN
    numerator = 1
    # Set the denominator to zero.
    denominator = 0
    # Try to divide and output the result.
    logger.error "About to divide by 0"
    result = numerator / denominator
    # begin
    #    @result = numerator / denominator
    # rescue => e
    #    logger.error ([e.message]+e.backtrace).join($/)
    # end
    render 'index'
  end
  def fetch_news

    require 'open-uri'
    require 'nokogiri'

    # --- Fetch data from Google news : Checking category ---
    @category = params[:category]
    path_news = ''
    if @category == 'headlines'
      #headlines
      path_news = 'https://news.google.com/topics/CAAqJggKIiBDQkFTRWdvSUwyMHZNRFZxYUdjU0FtVnVHZ0pWVXlnQVAB?hl=en-US&gl=US&ceid=US%3Aen'
    elsif  @category == 'world'
      #world
      path_news = 'https://news.google.com/topics/CAAqJggKIiBDQkFTRWdvSUwyMHZNRGx1YlY4U0FtVnVHZ0pWVXlnQVAB?hl=en-US&gl=US&ceid=US%3Aen'
    else
      #headlines
      path_news = 'https://news.google.com/topics/CAAqJggKIiBDQkFTRWdvSUwyMHZNRFZxYUdjU0FtVnVHZ0pWVXlnQVAB?hl=en-US&gl=US&ceid=US%3Aen'
    end
    #---- Set Proxy------
    page_content = open(path_news,
          proxy: URI.parse("http://192.41.170.23:3128")
        )

    doc = Nokogiri::HTML::Document.parse(page_content)
    # --- Extract HTML Part ---

    #'Headlines'
    all_news = doc.css('div.NiLAwe.gAl5If.jVwmLb.Oc0wGc.R7GTQ.keNKEd.j7vNaf.nID9nc div.xrnccd.F6Welf.R7GTQ.keNKEd.j7vNaf')
    news_items_size = all_news.size

    @ext_arr = Array.new(news_items_size) { Hash.new }
    num = 0
    google_news_url = 'https://news.google.com'
    for item in all_news

      title = item.css('article h3 span')
      link  = item.css('article h3 a').attr('href')
      pic   = item.css('figure img').attr('src')
      #---- Sub articles ---
      sub_news_title =  item.css('div.SbNwzf article div.mEaVNd h4')
      sub_news_link =  item.css('div.SbNwzf article')
      sub_title  = sub_news_title.css('span')
      sub_link   = sub_news_title.css('a')
      # puts sub_link
      # puts sub_link.size
      @ext_arr[num]['title']    = title.text
      @ext_arr[num]['news_pic']  = pic
      link[0] = ''
      @ext_arr[num]['news_link'] = google_news_url+link
      concat_sub_title = ''
      concat_sub_link  = ''
      # sub articles-title
      for sub_title_item in sub_title
          concat_sub_title = '|'+sub_title_item.text+concat_sub_title
      end
      # sub articles-link
      for sub_item_href in sub_link
         sub_href = sub_item_href['href']
         sub_href[0] = ''
         concat_sub_link = '|'+google_news_url+sub_href+concat_sub_link
      end

      # concat_sub_link[0] = ''
      @ext_arr[num]['sub_news']   = concat_sub_title
      @ext_arr[num]['sub_links']  = concat_sub_link
      # break
      num=num+1
    end

    render 'news'
  end
end
