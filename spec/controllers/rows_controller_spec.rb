require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe RowsController do

  # This should return the minimal set of attributes required to create a valid
  # Row. As you add validations to Row, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { {  } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # RowsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all rows as @rows" do
      row = Row.create! valid_attributes
      get :index, {}, valid_session
      assigns(:rows).should eq([row])
    end
  end

  describe "GET show" do
    it "assigns the requested row as @row" do
      row = Row.create! valid_attributes
      get :show, {:id => row.to_param}, valid_session
      assigns(:row).should eq(row)
    end
  end

  describe "GET new" do
    it "assigns a new row as @row" do
      get :new, {}, valid_session
      assigns(:row).should be_a_new(Row)
    end
  end

  describe "GET edit" do
    it "assigns the requested row as @row" do
      row = Row.create! valid_attributes
      get :edit, {:id => row.to_param}, valid_session
      assigns(:row).should eq(row)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Row" do
        expect {
          post :create, {:row => valid_attributes}, valid_session
        }.to change(Row, :count).by(1)
      end

      it "assigns a newly created row as @row" do
        post :create, {:row => valid_attributes}, valid_session
        assigns(:row).should be_a(Row)
        assigns(:row).should be_persisted
      end

      it "redirects to the created row" do
        post :create, {:row => valid_attributes}, valid_session
        response.should redirect_to(Row.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved row as @row" do
        # Trigger the behavior that occurs when invalid params are submitted
        Row.any_instance.stub(:save).and_return(false)
        post :create, {:row => {  }}, valid_session
        assigns(:row).should be_a_new(Row)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Row.any_instance.stub(:save).and_return(false)
        post :create, {:row => {  }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested row" do
        row = Row.create! valid_attributes
        # Assuming there are no other rows in the database, this
        # specifies that the Row created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Row.any_instance.should_receive(:update).with({ "these" => "params" })
        put :update, {:id => row.to_param, :row => { "these" => "params" }}, valid_session
      end

      it "assigns the requested row as @row" do
        row = Row.create! valid_attributes
        put :update, {:id => row.to_param, :row => valid_attributes}, valid_session
        assigns(:row).should eq(row)
      end

      it "redirects to the row" do
        row = Row.create! valid_attributes
        put :update, {:id => row.to_param, :row => valid_attributes}, valid_session
        response.should redirect_to(row)
      end
    end

    describe "with invalid params" do
      it "assigns the row as @row" do
        row = Row.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Row.any_instance.stub(:save).and_return(false)
        put :update, {:id => row.to_param, :row => {  }}, valid_session
        assigns(:row).should eq(row)
      end

      it "re-renders the 'edit' template" do
        row = Row.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Row.any_instance.stub(:save).and_return(false)
        put :update, {:id => row.to_param, :row => {  }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested row" do
      row = Row.create! valid_attributes
      expect {
        delete :destroy, {:id => row.to_param}, valid_session
      }.to change(Row, :count).by(-1)
    end

    it "redirects to the rows list" do
      row = Row.create! valid_attributes
      delete :destroy, {:id => row.to_param}, valid_session
      response.should redirect_to(rows_url)
    end
  end

end
