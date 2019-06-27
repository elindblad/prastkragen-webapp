require_relative './lib/slim-template.rb'
require 'date'
datum = DateTime.now
datum = datum.strftime("%Y-%m-%d")

data = []
file = File.readlines("data/user_data2.csv")
file.each do |element|
    checkline = element.strip.split(",")
    data << checkline
end

variables = {
    date: datum.to_s,
    data: data
}

html = slim(:index, locals: variables)

File.write("index.html",html)

html = slim(:nyheter, locals: variables)

File.write("nyheter.html",html)

html = slim(:verksamhet, locals: variables)

File.write("verksamhet.html",html)

html = slim(:personal, locals: variables)

File.write("personal.html",html)

html = slim(:blanketter, locals: variables)

File.write("blanketter.html",html)

html = slim(:lankar, locals: variables)

File.write("lankar.html",html)

html = slim(:kontaktinfo, locals: variables)

File.write("kontaktinfo.html",html)
