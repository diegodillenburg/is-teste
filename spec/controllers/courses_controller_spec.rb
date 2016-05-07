require 'rails_helper'

RSpec.describe CoursesController, type: :controller do
  let(:course) { build(:course) }
  let(:valid_attrs) { attributes_for(:course) }
  let(:invalid_attrs) { attributes_for(:invalid_course) }
  let(:courses) { create_list(:course, 4) }

  context '#index' do
    before(:each) { get :index }

    it 'assigns courses' do
      expect(assigns(:courses)).to match_array(courses)
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

    it 'assigns course to a new course' do
      expect(assigns(:course)).to be_a_new(Course)
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
      it 'increases course count' do
        expect do
          post :create, course: valid_attrs
        end.to change(Course, :count).by(1)
      end

      it 'redirects to courses#index' do
        post :create, course: valid_attrs

        expect(response).to redirect_to courses_path
      end
    end

    context 'failure' do
      it 'doesn\'t increase count' do
        expect do
          post :create, course: invalid_attrs
        end.not_to change(Course, :count)
      end

      it 're-enders the view' do
        post :create, course: invalid_attrs

        expect(response).to render_template(:new)
      end
    end
  end

  context '#edit' do
    before(:each) do
      course.save

      get :edit, id: course.id
    end

    it 'returns course from given id' do
      expect(assigns(:course)).to eq(course)
    end

    context 'rendering' do
      render_views

      it 'renders edit form' do
        expect(response).to render_template(:edit)
      end
    end
  end

  context '#update' do
    before(:each) { course.save }

    context 'success' do
      it 'updates attributes' do
        put :update, id: course.id, course: attributes_for(:course,
                                                name: "Teste")

        course.reload
        expect(course.name).to eq("Teste")
      end

      it 'redirects to index' do
        put :update, id: course.id, course: attributes_for(:course,
                                        name: "Teste")

        expect(response).to redirect_to courses_path
      end
    end

    context 'failure' do
      it 'doesn\'t update attributes' do
        put :update, id: course.id, course: attributes_for(:course,
                                                name: "Teste", status: nil)

        course.reload
        expect(course.name).not_to eq("Teste")
      end

      it 're-enders the form' do
        put :update, id: course.id, course: attributes_for(:course,
                                                name: "Teste", status: nil)

        expect(response).to render_template(:edit)
      end
    end
  end

  context '#destroy' do
    before(:each) { course.save }

    context 'success' do
      it 'decreases courses count' do
        expect do
          delete :destroy, id: course.id
        end.to change(Course, :count).by(-1)
      end

      it 'redirects to index' do
        delete :destroy, id: course.id

        expect(response).to redirect_to courses_path
      end
    end
  end
end
