require 'rails_helper'
include RandomData

RSpec.describe WikisController, type: :controller do
  let(:my_user) {User.create!(email:"new_user@aol.com", password:"password")}
  let(:my_wiki) {Wiki.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, private: false, user: my_user)}

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns my_wiki to @wikis" do
      get :index
      expect(assigns(:wikis)).to eq([my_wiki])
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, {id: my_wiki.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, {id: my_wiki.id}
      expect(response).to render_template :show
    end

    it "assigns my_wiki to @wiki" do
      get :show, {id: my_wiki.id}
      expect(assigns(:wiki)).to eq(my_wiki)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "POST create" do
    it "increases the number of wikis by 1" do
      expect{post :create, wiki: {title: RandomData.random_sentence, body: RandomData.random_paragraph, private: false, user: my_user}}.to change(Wiki, :count).by(1)
    end

    it "assigns the new wiki to @wiki" do
      post :create, wiki: {title: RandomData.random_sentence, body: RandomData.random_paragraph, private: false, user: my_user}
      expect(assigns(:wiki)).to eq Wiki.last
    end

    it "redirects to the new wiki" do
      post :create, wiki: {title: RandomData.random_sentence, body: RandomData.random_paragraph, private: false, user: my_user}
      expect(response).to redirect_to Wiki.last
    end
  end


  describe "GET #edit" do
    it "returns http success" do
      get :edit, {id: my_wiki.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #edit view" do
      get :edit, {id: my_wiki.id}
      expect(response).to render_template :edit
    end

    it "assigns wiki to be updated to @wiki" do
      get :edit, {id: my_wiki.id}
      wiki_instance = assigns(:wiki)
      expect(wiki_instance.id).to eq my_wiki.id
      expect(wiki_instance.title).to eq my_wiki.title
      expect(wiki_instance.body).to eq my_wiki.body
      expect(wiki_instance.private).to eq my_wiki.private
    end
  end

  describe "PUT update" do
    it "updates wiki with expected attributes" do
      new_title = RandomData.random_sentence
      new_body = RandomData.random_paragraph
      new_private = true
      #new_user = my_user
      put :update, id: my_wiki.id, wiki: {title: new_title, body: new_body, private: new_private}

      updated_wiki = assigns(:wiki)
      expect(updated_wiki.id).to eq my_wiki.id
      expect(updated_wiki.title).to eq new_title
      expect(updated_wiki.body).to eq new_body
      expect(updated_wiki.private).to eq new_private
      #expect(updated_wiki.user.id).to eq new_user.id
    end

    it "redirects to the updated post" do
      new_title = RandomData.random_sentence
      new_body = RandomData.random_paragraph
      new_private = true
      #new_user = my_user
      put :update, id: my_wiki.id, wiki: {title: new_title, body: new_body, private: new_private}
      expect(response).to redirect_to my_wiki
    end
  end

  describe "DELETE destroy" do
    it "deletes the wiki" do
      delete :destroy, {id: my_wiki.id}
      count = Wiki.where({id: my_wiki.id}).size
      expect(count). eq 0
    end

    it "redirects to wiki index" do
      delete :destroy, {id: my_wiki.id}
      expect(response).to redirect_to wikis_path
    end
  end

end
