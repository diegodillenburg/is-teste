require 'rails_helper'

RSpec.describe ClassroomsController, type: :controller do
  let(:classroom) { build(:classroom) }
  let(:valid_attrs) { attributes_for(:classroom) }
  let(:invalid_attrs) { attributes_for(:invalid_classroom) }
  let(:classrooms) { create_list(:classroom, 4) }

  context '#index' do
    before(:each) { get :index }

    it 'assigns classrooms' do
      expect(assigns(:classrooms)).to match_array(classrooms)
    end

    context 'rendering' do
      render_views

      it 'renders the view' do
        expect(response).to render_template(:index)
      end
    end
  end

  context '#new' do
    before(:each) { get :new }

    it 'assigns classroom to a new classroom' do
      expect(assigns(:classroom)).to be_a_new(Classroom)
    end

    context 'rendering' do
      render_views

      it 'renders the view' do
        expect(response).to render_template(:new)
      end
    end
  end

  context '#create' do
    context 'success' do
      it 'increases classroom count' do
        expect do
          post :create, classroom: valid_attrs
        end.to change(Classroom, :count).by(1)
      end

      it 'redirects to classrooms#index' do
        post :create, classroom: valid_attrs

        expect(response).to redirect_to classrooms_path
      end
    end

    context 'failure' do
      it 'doesn\'t increase count' do
        expect do
          post :create, classroom: invalid_attrs
        end.not_to change(Classroom, :count)
      end

      it 're-enders the view' do
        post :create, classroom: invalid_attrs

        expect(response).to render_template(:new)
      end
    end
  end

  context '#edit' do
    before(:each) do
      classroom.save

      get :edit, id: classroom.id
    end

    it 'returns classroom from given id' do
      expect(assigns(:classroom)).to eq(classroom)
    end

    context 'rendering' do
      render_views

      it 'renders edit form' do
        expect(response).to render_template(:edit)
      end
    end
  end

  context '#update' do
    before(:each) { classroom.save }

    context 'success' do
      it 'updates attributes' do
        put :update, id: classroom.id, classroom: attributes_for(:classroom,
                                                student_id: 2)

        classroom.reload
        expect(classroom.student_id).to eq(2)
      end

      it 'redirects to index' do
        put :update, id: classroom.id, classroom: attributes_for(:classroom,
                                        student_id: 2)

        expect(response).to redirect_to classrooms_path
      end
    end

    context 'failure' do
      it 'doesn\'t update attributes' do
        put :update, id: classroom.id, classroom: attributes_for(:classroom,
                                                student_id: 2, course_id: nil)

        classroom.reload
        expect(classroom.student_id).not_to eq(2)
      end

      it 're-enders the form' do
        put :update, id: classroom.id, classroom: attributes_for(:classroom,
                                                student_id: 2, course_id: nil)

        expect(response).to render_template(:edit)
      end
    end
  end

  context '#destroy' do
    before(:each) { classroom.save }

    context 'success' do
      it 'decreases classrooms count' do
        expect do
          delete :destroy, id: classroom.id
        end.to change(Classroom, :count).by(-1)
      end

      it 'redirects to index' do
        delete :destroy, id: classroom.id

        expect(response).to redirect_to classrooms_path
      end
    end
  end
end
