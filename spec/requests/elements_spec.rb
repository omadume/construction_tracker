require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/elements", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # Element. As you add validations to Element, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Element.create! valid_attributes
      get elements_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      element = Element.create! valid_attributes
      get element_url(element)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_element_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      element = Element.create! valid_attributes
      get edit_element_url(element)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Element" do
        expect {
          post elements_url, params: { element: valid_attributes }
        }.to change(Element, :count).by(1)
      end

      it "redirects to the created element" do
        post elements_url, params: { element: valid_attributes }
        expect(response).to redirect_to(element_url(Element.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Element" do
        expect {
          post elements_url, params: { element: invalid_attributes }
        }.to change(Element, :count).by(0)
      end

    
      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post elements_url, params: { element: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested element" do
        element = Element.create! valid_attributes
        patch element_url(element), params: { element: new_attributes }
        element.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the element" do
        element = Element.create! valid_attributes
        patch element_url(element), params: { element: new_attributes }
        element.reload
        expect(response).to redirect_to(element_url(element))
      end
    end

    context "with invalid parameters" do
    
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        element = Element.create! valid_attributes
        patch element_url(element), params: { element: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested element" do
      element = Element.create! valid_attributes
      expect {
        delete element_url(element)
      }.to change(Element, :count).by(-1)
    end

    it "redirects to the elements list" do
      element = Element.create! valid_attributes
      delete element_url(element)
      expect(response).to redirect_to(elements_url)
    end
  end
end