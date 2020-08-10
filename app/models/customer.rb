class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :cart_products, dependent: :destroy
  has_many :orders
  has_many :ships, dependent: :destroy
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :kana_last_name, presence: true, format: {with: /\A[ｧ-ﾝﾞﾟァ-ヶー－]+\z/ }
  validates :kana_first_name, presence: true, format: {with: /\A[ｧ-ﾝﾞﾟァ-ヶー－]+\z/ }
  validates :postal_code, presence: true, format: { with: /\A\d{7}\z/ }
  validates :address, presence: true
  validates :phone, presence: true, format: { with: /\A\d{10,11}\z/ }

  def update_without_current_password(params, *options)
    params.delete(:current_password)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result= update_attributes(params, *options)
    clean_up_passwords
    result
  end

  def active_for_authentication?
    super && self.is_active?
  end



  def full_name
    self.last_name+self.first_name
  end

end
