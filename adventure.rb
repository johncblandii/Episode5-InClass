require 'rubygems'
require 'bundler/setup'
require_relative "db/setup"
require_relative "models/page"
require_relative "models/book"

page = Page.create(starting_point: true, content: "You woke up on a road. It's foggy and dampy. In your bag is 30 gold pieces and a bacon sandwich. Which do you choose?")
Page.create(conclusion: true, parent_id: page.id, content: "WINNER")
Page.create(conclusion: true, parent_id: page.id, content: "LOSER")

book = Book.new(page)

until book.complete_game? do
	puts book.current_page.content
	puts "your options: "
	puts " - [#{book.current_page.options.first}"
	puts " - [#{book.current_page.options.last}"
	puts "What do ou want to do? Enter A or B"

	book.input(gets)
end