namespace :visit do
  task :generate_page_views => :environment do
    for i in 0..100
      page_view = {}
      keyword_views = []
      page = {}
      at = {}

      page_visited = Page.all.shuffle[rand(Page.count)]
      page["url"] = page_visited.url
      page["type"] = page_visited.type
      
      if page_visited.type == "Article"
        page["author"] = page_visited.content_item.author.name
        page["keywords"] = page_visited.content_item.keywords.map { |k| k.word }
      end

      if page_visited.type == "Landing"
        page["topic"] = page_visited.topic
      end

      page_view["page"] = page
      page_view["user_agent"] = DEFAULT_USER_AGENT

      if rand(10) < 5
        page_view["referrer"] = DEFAULT_EXTERNAL_REFERRER
      else
        referrer = {
          "type" => "internal",
          "source" => Landing.all.shuffle[0].url,
          "keyword" => Keyword.all.shuffle[rand(Keyword.count)].word
        }
        page_view["referrer"] = referrer
      end
      page_view["session"] = DEFAULT_SESSION

      visit_time = Time.now.advance(:minutes => -rand(10000))
      at["timestamp"] = visit_time 
      at["day_of_week"] = visit_time.strftime("%A")
      at["hour_of_day"] = visit_time.hour

      page_view["at"] = at

      # puts page_view.to_json
      putc '.'
      Keen.publish(:page_views, page_view)
    end
  end
end