# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Deletes everything from the database so that you start fresh
puts "Deleting all records from the database..."
Article.delete_all
Author.delete_all
Publication.delete_all
Category.delete_all

# Create the authors
puts "Creating authors..."
aditi_shah = Author.create(name: "Aditi Shah")
kt_jagannathan = Author.create(name: "K T Jagannathan")
rishi_iyengar = Author.create(name: "Rishi Iyengar")
none = Author.create(name: "None")

# Create the publications
puts "Creating publications..."
time = Publication.create(name: "Time")
the_hindu = Publication.create(name: "The Hindu")
live_mint = Publication.create(name: "Live Mint")
firstpost = Publication.create(name: "Firstpost")

# Create the categories
puts "Creating categories..."
home = Category.create(name: "Home")
politics = Category.create(name: "Politics")
finance = Category.create(name: "Finance")
sports = Category.create(name: "Sports")
oped_blogs = Category.create(name: "OpEd/Blogs")
entertainment = Category.create(name: "Entertainment")


# Create the articles
puts "Creating articles..."
bollywood_divided = Article.create(title: "Bollywood divided over compulsory prime time screening of Marathi films in multiplexes", date: "4/7/2015", publication_id: firstpost.id, author_id: none.id, first_few_lines: "In a move that is guaranteed to cause some degree of controversy..", photo_url: "http://s1.firstpost.in/wp-content/uploads/2015/04/cinema.png", category_id: home.id)
indian_ice_hockey = Article.create(title: "Crowd-funded Indian ice hockey team geared up for Challenge Cup", date: "4/15/2015", publication_id: firstpost.id, author_id: none.id, first_few_lines: "The Indian ice hockey team is finally on its way to Kuwait for the Challenge Cup Division 1..", photo_url: "http://s1.firstpost.in/wp-content/uploads/2015/04/IceHockey-gen-Getty1.jpg", category_id: sports.id)
smart_city = Article.create(title: "India's first smart city takes shape in GIFT", date: "4/15/2015", publication_id: live_mint.id, author_id: aditi_shah.id, first_few_lines: "Gandhinagar: India's push to accommodate a booming urban population and attract investment..", photo_url: "http://www.livemint.com/rf/Image-621x414/LiveMint/Period1/2015/04/16/Photos/gift%20city%20tower-k5j--621x414@LiveMint.jpg", category_id: home.id)
india_us_prices = Article.create(title: "How Indian prices compare with those in the US", date: "4/23/2015", publication_id: live_mint.id, author_id: none.id, first_few_lines: "IDeutsche Bank's global strategist Sanjeev Sanyal has brought out a report, 'Random Walk: Mapping the World's Prices 2015'..", photo_url: "http://www.livemint.com/rf/Image-621x414/LiveMint/Period1/2015/04/16/Photos/w_m2m_usprice.jpg", category_id: home.id)
flipkart_flipside = Article.create(title: "Flipkart & flipside", date: "4/7/2015", publication_id: the_hindu.id, author_id: kt_jagannathan.id, first_few_lines: "Even as it pulled out of talks on joining Airtel Zero, native e-commerce major Flipkart asserted that it has always believed in the concept of Net Neutrality..", photo_url: "http://www.thehindu.com/multimedia/dynamic/02368/flipkart_2368663g.jpg", category_id: home.id)
growing_economy = Article.create(title: "This Country Looks Like It Will Grow Faster Than China This Year", date: "4/15/2015", publication_id: firstpost.id, author_id: none.id, first_few_lines: "India's economic growth may surpass China's much sooner than initially expected..", photo_url: "https://timedotcom.files.wordpress.com/2015/04/450697406.jpg?quality=65&strip=color&w=1100", category_id: finance.id)

puts "There are now #{Article.count} articles, #{Author.count} authors, #{Publication.count} publications, and #{Category.count} categories in the database."