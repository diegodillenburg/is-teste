require 'rails_helper'

RSpec.describe StudentsController, type: :controller do
  let(:student) { build(:student) }
  let(:valid_attrs) { attributes_for(:student) }
  let(:invalid_attrs) { attributes_for(:invalid_student) }
  let(:students) { create_list(:student, 4) }

  context '#index' do
    before(:each) { get :index }

    it 'assigns students' do
      expect(assigns(:students)).to match_array(students)
    end

    context 'rendering' do
      render_views

      it 'renders the view' do
        expect(response).to render_template(:index)
      end
    end
  end

  context '#show' do
    before(:each) do
      student.save
      get :show, id: student.id
    end

    it 'assigns student' do
      expect(assigns(:student)).to eq(student)
    end

    context 'rendering' do
      render_views

      it 'renders the view' do
        expect(response).to render_template(:show)
      end
    end
  end

  context '#new' do
    before(:each) { get :new }

    it 'assigns student to a new Student' do
      expect(assigns(:student)).to be_a_new(Student)
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
      it 'increases student count' do
        expect do
          post :create, student: valid_attrs
        end.to change(Student, :count).by(1)
      end

      it 'redirects to students#index' do
        post :create, student: valid_attrs

        expect(response).to redirect_to student_path(Student.last)
      end
    end

    context 'failure' do
      it 'doesn\'t increase count' do
        expect do
          post :create, student: invalid_attrs
        end.not_to change(Student, :count)
      end

      it 're-enders the view' do
        post :create, student: invalid_attrs

        expect(response).to render_template(:new)
      end
    end
  end

  context '#edit' do
    before(:each) do
      student.save

      get :edit, id: student.id
    end

    it 'returns student from given id' do
      expect(assigns(:student)).to eq(student)
    end

    context 'rendering' do
      render_views

      it 'renders edit form' do
        expect(response).to render_template(:edit)
      end
    end
  end

  context '#update' do
    before(:each) { student.save }

    context 'success' do
      it 'updates attributes' do
        put :update, id: student.id, student: attributes_for(:student,
                                                name: "Teste")

        student.reload
        expect(student.name).to eq("Teste")
      end

      it 'redirects to index' do
        put :update, id: student.id, student: attributes_for(:student,
                                        name: "Teste")

        expect(response).to redirect_to student_path(student)
      end
    end

    context 'failure' do
      it 'doesn\'t update attributes' do
        put :update, id: student.id, student: attributes_for(:student,
                                                name: "Teste", status: nil)

        student.reload
        expect(student.name).not_to eq("Teste")
      end

      it 're-enders the form' do
        put :update, id: student.id, student: attributes_for(:student,
                                                name: "Teste", status: nil)

        expect(response).to render_template(:edit)
      end
    end
  end

  context '#destroy' do
    before(:each) { student.save }

    context 'success' do
      it 'decreases students count' do
        expect do
          delete :destroy, id: student.id
        end.to change(Student, :count).by(-1)
      end

      it 'redirects to index' do
        delete :destroy, id: student.id

        expect(response).to redirect_to students_path
      end
    end
  end
end
