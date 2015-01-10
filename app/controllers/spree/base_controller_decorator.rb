module Spree
  BaseController.class_eval do
    cattr_accessor :spree_decoration_targets
    self.spree_decoration_targets = []

    class << self
      def spree_decorate(*vars)
        vars.each { |v| spree_decoration_targets << '@' + v.to_s }
      end
    end

    protected

    def render(options = nil, extra_options = {}, &block)
      decorate_with_draper
      super(options, extra_options, &block)
    end

    def decorate_with_draper
      self.class.spree_decoration_targets.each do |var|
        instance_variable_set(var, instance_variable_get(var).try(:decorate))
      end
    end
  end
end
