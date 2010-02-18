class Country < ActiveRecord::Base
  	has_many :users

    class << self
    	def list_for_select( continent_id = nil )
        if(continent_id.nil?)
          Country.find(:all, :conditions => ["`show` = ?", "Y"], :order => "sort_order, name").map {|c| [c.name, c.id]}
        else
          Country.find(:all, :conditions => ["`show` = ? and `continent_id` = ?", "Y", continent_id ], :order => "sort_order, name").map {|c| [c.name, c.id]}
        end
      end

      def list_for_select_all #for use in admin
        Country.find(:all, :order => "sort_order, name").map {|c| [c.name, c.id]}
      end

      def from_http_accept_language( languages )
        languages = languages.split(',').map {|a| a.split('-')}
        return nil if languages.empty?
        Country.find(:first, :conditions=>["`show`=? and `iso_code_2`=?",'Y',languages[0][0]] )
      end
    end
end


