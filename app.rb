require 'sinatra'
require_relative 'model.rb'
enable :sessions

configure do 
    set :bind, '0.0.0.0'
end

helpers do
    def set_error(msg)
        session[:error] = msg
    end
    
    def get_error()        
        error = session[:error]
        session[:error] = nil
        return error
    end

    def error?
        !session[:error].nil?
    end

    def login_status(usr)
        session[:username] = usr
    end

    def get_login_status()
        usr = session[:username]
        return usr
    end
end

include Model

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

get('/login') do 
    slim(:login)
end

post('/login') do
    login = Users.login(params)
    if login != false
        login_status(login)
        redirect('/')
    else
        set_error("Fel användarnamn eller lösenord!")
        redirect('/login')
    end
end

post('/logout') do
    session.destroy
    redirect(back)
end