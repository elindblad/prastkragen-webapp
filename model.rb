module Model

    module Db
        # Loads the databse
        def self.connect
            Sequel.connect(ENV['DATABASE_URL'] || 'sqlite://db/data.db')
        end
    end

    module User
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
            # db = Db.connect
            result = Db.connect[:users].first(:UserName => params["UserName"])
            if result == nil
                return false
            elsif checkpassword(params["PassWord"],result[:Hash]) == true
                return result[:UserName]
            else
                return false
            end
        end
    end

    module Post
        def self.newpost(params)
            Db.connect[:news].insert(Title: "#{params["Title"]}", SubTitle: "#{params["SubTitle"]}", Text: "#{"Text"}", ImgId: "1337", Date: Date.today)
            # Title
            # Subtitle
            # Text
            # ImgId
            # Date
        end
        def self.get()
            return Db.connect[:news]
        end
    end
end