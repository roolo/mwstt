require 'spec_helper'

describe "Datetimes" do
  describe "PUT /datetimes/:id" do
    it "updates new datetime" do
      get root_path
      
      datetime = Factory.create :datetime
      UserSession.create(username: datetime.user.username, password: datetime.user.password)
      
      puts datetime.user.password
      
      put datetime_path(id: datetime.id, format: :xml), datetime: {in_ctt: true}
      response.should eq 200
      datetime.reload
      datetime.in_ctt.should eq true
    end
  end
end