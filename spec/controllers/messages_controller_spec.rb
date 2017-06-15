require 'rails_helper'

describe MessagesController do

  let(:user) { create(:user) }
  let(:group) { create(:group) }
  let(:groups) { create_list(:group, 3, user_ids: user.id) }
  let(:message) { create(:message, user_id: user.id, group_id: group.id) }
  let(:messages) { create_list(:message, 3, user_id: user.id, group_id: group.id) }

  # #以下ログインしている場合
  describe 'user access' do
    #メッセージ一覧を表示するアクション
    describe 'GET #new' do
      #ログイン状態の作成
      before do
        login_user user
      end

      #@messageに期待される値が入っていること
      it "assigns the requested message to @message" do
        get :new, user_id: user.id, group_id: group.id
        expect(assigns(:message)).to be_a_new(Message)
      end

      #@messagesに期待される値が入っていること
      it "assigns to the requested messages to @messages" do
        get :new, user_id: user.id, group_id: group.id
        expect(assigns(:messages)). to eq messages
      end

      #@groupに期待される値が入っていること
      it "assigns the requested group to @group" do
        get :new, user_id: user.id, group_id: group.id
        expect(assigns(:group)).to eq group
      end

      #@groupsに期待される値が入っていること
      it "assigns the requested groups to @groups" do
        get :new, user_id: user.id, group_id: group.id
        expect(assigns(:groups)).to eq groups
      end

      #new テンプレートを表示すること
      it "renders the new template" do
        get :new, user_id: user.id, group_id: group.id
        expect(response).to render_template("new")
      end
    end

    #メッセージ作成するアクション
    describe 'POST #create' do
      before do
        login_user user
      end
        #保存に成功した場合
        context "when save successful" do
          #メッセージをデータベースの保存すること
          it "is saved in the database" do
            message_params = attributes_for(:message)
            expect{
              post :create, group_id: group, user_id: user, message:message_params
            }.to change(Message, :count).by(1)
          end
          #flashを出すこと
          it "flash success message" do
            message_params = attributes_for(:message)
            post :create, group_id: group.id, user_id: user.id, message: message_params
            expect(flash[:notice]). try(:include, " メッセージが送信されました")
          end
          # message#newにリダイレクトすること
          it "redirect to the new template" do
            message_params = attributes_for(:message)
            post :create, group_id: group.id, user_id: user.id, message: message_params
            expect(response).to redirect_to new_group_message_path
          end
        end

        #保存に失敗した場合
        context "when save failure" do
          #メッセージを保存しないこと
          it "is not saved in the database" do
            message_params = attributes_for(:message, text: nil, avatar: nil)
            expect{
            post :create, group_id: group.id, user_id: user.id, message: message_params
            }. to change(Message, :count).by(0)
          end
          #flashを出さないこと
          it "does not flash" do
            message_params = attributes_for(:message, text: nil, avatar: nil)
            post :create, group_id: group.id, user_id: user.id, message: message_params
            expect(flash[:alert]). try(:include, " メッセージを入力してください")
          end
          # message#newにレンダリングすること
          it "renders to the new template" do
            message_params = attributes_for(:message, text: nil, avatar: nil)
            post :create, group_id: group.id, user_id: user.id, message: message_params
            expect(response).to redirect_to new_group_message_path
          end
        end
      end
    end

  #以下未ログインの場合
  describe "guest access" do

    # メッセージ一覧を表示するアクション
    describe 'GET #new' do
      #ログインを要求すること
      it "requires login" do
        get :new, user_id: user.id, group_id: group.id
        expect(response).to redirect_to new_user_session_path
      end
    end

      #メッセージ作成するアクション
    describe 'POST #create' do
      #ログインを要求すること
      it "requires login" do
        post :create, user_id: user.id, group_id: group.id
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
