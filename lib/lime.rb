
class ContactImporter

  def loadup
    wordlist = ['crashed AND computer', 'broke AND computer', 'broke AND laptop', 'crashed AND harddrive', 'laptop AND crashed',
    'laptop AND problem', 'install AND problem', 'download AND problem', 'virus AND computer', 'virus AND laptop']
    @twitter_handle = []
    
    wordlist.each do |w|
      @search = Twitter::Search.new
      @day = Date.today.day
      @search.containing("#{w}").geocode(35.2270869, -80.8431267, "9mi").since_date("#{Time.now.year}-#{Time.now.month-1}-#{25}").per_page(50).fetch.each do |s|
        
        contact = Contact.find_or_create_by_name(s.from_user)
        Tweet.find_or_create_by_message_and_tweet_date_and_contact_id(s.text, s.created_at, Contact.all(:conditions => "name = '#{s.from_user}'").first.id)


        @twitter_handle << s.from_user
        end
      end
    end    
        
  # 
  #   until @users_list.include?(@selected_user_name) || @selected_user_name==""
  #     puts "Please select a user to tweet at and strike return:" 
  #     @selected_user_name = gets.chomp
  #   end
  #  
  #   puts "Hey @#{@selected_user_name}, I'm Stewart with lime:tribe support on North Davidson. I've been fixing computers around here since
  #   the waters of 1937 rose above the banks of the Mississipi.  If your goldarn computer needs a spankin, I'm your man!"
  
end
