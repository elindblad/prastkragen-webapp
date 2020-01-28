module Model
    # Loads the databse
    def self.connect
        Sequel.connect(ENV['DATABASE_URL'] || 'sqlite://db/data.db')
    end

    module Users
        # Hashes inputpassword and compares it to the hash in database
        def self.checkpassword(pw,dbpw)
            if BCrypt::Password.new(dbpw) == pw
                return true
            else
                return false
            end
        end

        # Attempts to authenticate the user
        def self.login(params)
            db = Model.connect()
            result = db[:users].first(:UserName => params["UserName"])
            if result == nil
                return false
            elsif checkpassword(params["PassWord"],result[:Hash]) == true
                return result[:UserName]
            else
                return false
            end
        end
    end
end