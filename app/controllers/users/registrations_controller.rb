class Users::RegistrationsController < Devise::RegistrationsController
  def create
    build_resource(sign_up_params)
    resource.admin = false
    resource.save
    if resource.persisted?
      sign_in(resource)
      redirect_to root_path, notice: "Compte créé avec succès."
    else
      clean_up_passwords resource
      render :new, status: :unprocessable_entity
    end
  end
end
