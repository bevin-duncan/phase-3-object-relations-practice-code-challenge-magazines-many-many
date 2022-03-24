class Reader < ActiveRecord::Base
    has_many :subscriptions
    has_many :magazines, through: :subscriptions
  
    def subscribe(price, magazine)
      subscriptions.create(price: price, magazine: magazine)  
    end
  
    def total_subscription_price
      subscriptions.all.sum(:price)
    end
  
    def cancel_subscription(magazine)
  
     deleted_magazine = self.subscriptions.find_by(magazine: magazine)
     deleted_magazine.destroy || "This reader is not subscribed"
    end 
  
end