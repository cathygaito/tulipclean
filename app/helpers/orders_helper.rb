module OrdersHelper
    

	def existing_order?
		a = find_customer_orders(@current_user)
        if a == []
            return false
        elsif select_open_order(a) == []
            return false
        else
            return true
        end
    end

    def find_customer_orders(user)
        a = []
        user.orders.find_each do |x|
            a << x
        end
        return a
    end

    def find_open_order
        a = find_customer_orders(@current_user)
        b = select_open_order(a)
        return b.first.to_i
    end

    def select_open_order(a)
        b = []
        a.each do |y|
            if y.stripeToken.nil?
                b << y.id
            end
        end
        return b
    end
	
	def push_order(order)
		z = []
		z << order.quantity << Product.find_by(id: order.productID).sku << Product.find_by(id: order.productID).description
    	if !Product.find_by(id: order.productID).color.blank?
      		z << Product.find_by(id: order.productID).color
    	end
    	if !Product.find_by(id: order.productID).flavor.blank?
      		z << Product.find_by(id: order.productID).flavor
    	end
    	z << Product.find_by(id: order.productID).price.to_f
    	order.user_id = current_user.id
    	order.item << z
    end

    def push_update(existing, additions)
    	z = []
    	z << additions[:quantity]
    	z << Product.find_by(id: additions[:productID]).sku
    	z << Product.find_by(id: additions[:productID]).description
    	if !Product.find_by(id: additions[:productID]).color.blank?
      		z << Product.find_by(id: additions[:productID]).color
    	end
    	if !Product.find_by(id: additions[:productID]).flavor.blank?
      		z << Product.find_by(id: additions[:productID]).flavor
    	end
    	z << Product.find_by(id: additions[:productID]).price.to_f
    	existing.item << z
    end

    def push_stripe(params)
        z = params[:stripeToken]
        order = Order.find_by(id: params[:id])
        order.stripeToken = z
        order.save

        Stripe.api_key = "sk_live_uofBKTGXEsEAMfZXFz73Pbx3"

        token = params[:stripeToken]

        begin
            charge = Stripe::Charge.create(
                :amount => (order_total(order)*100).round, # amount in cents, again
                :currency => "usd",
                :source => token,
                :description => "Tulip online purchase"
            )
        rescue Stripe::CardError => e
            # The card has been declined
        end
    end

    def send_user(order)
    	@user = @current_user
    	@user.purchases.push(order.id.to_i).flatten!
    	@user.save
    end

    def order_total(order)
        y = 0
        order.item.each do |x|
            y += (x[0].to_f)*(x[4].to_f)
        end
        return y
    end

end