require 'spec_helper'

describe GalleriesController do

    describe "GET #index" do
    it "populates an array of galleries" do
      
    end
    
    it "renders the :index view" do
      get :index
      response.should render_template :index
    end
  end

end
