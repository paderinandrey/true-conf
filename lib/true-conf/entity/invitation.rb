# frozen_string_literal: true

module TrueConf
  module Entity
    class Invitation < TrueConf::Response
      extend TrueConf::Callable

      option :id, proc(&:to_s)
      option :uid, proc(&:to_s)
      option :avatar
      option :login_name, proc(&:to_s)
      option :email, proc(&:to_s)
      option :display_name, proc(&:to_s)
      option :first_name, proc(&:to_s)
      option :last_name, proc(&:to_s)
      option :company, proc(&:to_s)
      option :groups, method(:Array)
      option :mobile_phone, proc(&:to_s)
      option :work_phone, proc(&:to_s)
      option :home_phone, proc(&:to_s)
      option :is_active, proc(&:to_i)
      option :status, proc(&:to_i)
      option :is_owner
      option :type, proc(&:to_s)

      def owner?
        is_owner == 1
      end

      %w[user custom].each do |method|
        define_method("#{method}?") do
          type == method
        end
      end
    end
  end
end
