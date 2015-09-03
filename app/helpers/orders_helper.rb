module OrdersHelper

	def existing_order?
		@user = @current_user
		unless @user.purchases == []

			#THIS IS A BAD TEST FOR SOME REASON!
			@user.purchases.each do |z|
				if Order.find(z).shipmentTracker == nil
					return true
				else
					return false
				end
			end
		end
    end

    def open_order
    	unless @current_user.purchases == []
    		@current_user.purchases.each do |z|
    			if Order.find(z).shipmentTracker == nil
    				return z
    			end
    		end
    	end
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

    def send_user(order)
    	@user = User.find_by(id: @current_user.id)
    	@user.purchases.push(order.id.to_i).flatten!
    	@user.save
    end

end