require 'sinatra'

configure do 
    set :bind, '0.0.0.0'
end

get('/') do 
    slim(:index)
end

get('/nyheter') do
    slim(:nyheter)
end

get('/verksamhet') do
    slim(:verksamhet)
end

get('/personal') do
    slim(:personal)
end

get('/blanketter') do
    slim(:blanketter)
end

get('/lankar') do
    slim(:lankar)
end

get('/kontaktinfo') do
    slim(:kontaktinfo)
end