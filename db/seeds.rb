# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Author.delete_all
cersei_lannister = Author.create(name: 'Cersei Lannister')
tyrion_lannister = Author.create(name: 'Tyrion Lannister')
ned_stark = Author.create(name: 'Ned Stark')
jon_snow = Author.create(name: 'Jon Snow')
arya_stark = Author.create(name: 'Arya Stark')
stannis_baratheon = Author.create(name: 'Stannis Baratheon')
danaerys_targaryen = Author.create(name: 'Danaerys Targaryen')

Keyword.delete_all
battle = Keyword.create(word: 'battle')
espionage = Keyword.create(word: 'espionage')
investment = Keyword.create(word: 'investment')
savings = Keyword.create(word: 'savings')
adventure = Keyword.create(word: 'adventure')
poverty = Keyword.create(word: 'poverty')
cooking = Keyword.create(word: 'cooking')

Topic.delete_all
current_affairs = Topic.create(title: 'Current Affairs')
local_news = Topic.create(title: 'Local News')
sports_and_entertainment = Topic.create(title: 'Sports and Entertainment')
financial_matters = Topic.create(title: 'Financial Matters')
scoops_and_scandals = Topic.create(title: 'Scoops and Scandals')

ContentItem.delete_all
c1 = ContentItem.create(
  title: "Defending Kings Landing",
  content: "",
  author: tyrion_lannister
  )

c2 = ContentItem.create(
  title: "Politics 101",
  content: "",
  author: cersei_lannister
  )

c3 = ContentItem.create(
  title: "Dying a noble death",
  content: "",
  author: ned_stark
  )

c4 = ContentItem.create(
  title: "Celibacy as an art form",
  content: "",
  author: jon_snow
  )

c5 = ContentItem.create(
  title: "Saving for a sea voyage",
  content: "",
  author: arya_stark
  )

c6 = ContentItem.create(
  title: "How to see red",
  content: "",
  author: stannis_baratheon
  )

c7 = ContentItem.create(
  title: "Learning to fly",
  content: "",
  author: danaerys_targaryen
  )

ContentItem.all.each do |c|
  keywords = Keyword.all.shuffle
  random_keyword_index = rand(Keyword.count)
  c.keywords << keywords[random_keyword_index]
  c.keywords << keywords[(random_keyword_index + 1) % Keyword.count]
end

Page.delete_all
ContentItem.all.each do |c|
  p = Page.create(
    url: "/articles/" + c.slug,
    type: "Article"
    )
  p.content_items << c
end

Topic.all.each do |t|
  p = Page.create(
    url: "/topics/" + t.slug,
    type: "Landing",
    topic: t
    )
  ContentItem.all.shuffle[0..3].each do |c|
    p.content_items << c
  end
end