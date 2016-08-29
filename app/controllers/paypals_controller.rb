  post '/api/login' => 'sessions#api_login'
  get '/api/purchase' => 'sessions#api_purchase'

   # paypal
    def api_login
      params[:user_id, :password]
      user = login(params) 
      session_id = BCrypt(user.id)
      temporarydatabase.sessions[session_id] = user.id
      return json object { session_id: session_id }
    end

    def api_purhcase
      session_id = params[:session_id]      
      amount = params[:amount]      
      item_id = params[:item_id]      
      address_info = params[:address_info]

      user = user.find(
        temporarydatabase.sessions[session_id]
      )

      purchase = Purchase.new(
        user: user,
        amount: amount,
        address_info: address_info
      )

      if purchase.save
        return { success: :ok}
      else
        return { success: false}
      end
    end
  end