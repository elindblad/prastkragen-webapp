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

    def login?
        !session[:username].nil?
    end
    
    def get_login_status()
        return session[:username]
    end
end

include Model

get('/') do 
    posts = Post.get
    slim(:index, locals:{
            posts: posts
        }
    )
end

get('/nyheter') do
    posts = Post.get
    slim(:nyheter, locals:{
            posts: posts
        }
    )
end

get('/nyheter/art:id') do
    posts = Post.get
    slim(:nyheter, locals:{
            posts: posts
        }
    )
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

get('/newpost') do 
    slim(:newpost)
end

post('/newpost') do
    Post.newpost(params)
    redirect('/nyheter')
end

post('/login') do
    if User.login(params)!= false
        login_status(User.login(params))
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