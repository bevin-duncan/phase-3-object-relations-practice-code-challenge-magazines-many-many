class Magazine < ActiveRecord::Base
  
has_many :subscriptions 
  has_many :readers, through: :subscriptions

  def email_list
#    subscriptions.readers.map do |reader| 
#     "#{reader.email};"
#    end
self.readers.pluck(:email).join(";")
  end

    def most_popular
        self.all.max_by{|mag| mag.subscriptions.length}
    end       

end