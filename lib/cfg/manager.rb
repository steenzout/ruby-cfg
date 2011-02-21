module Steenzout

  # Class to hold gem configurations.
  class ConfigurationManager

    @@loaded_configurations = {}
    @@configurations = nil

    # Loads the configuration from the given file.
    # As convention, the configuration file should have as top symbol the gem name.
    #
    # Example:
    #   :steenzout-cfg:
    #     :log: 'log/development.log'
    #
    # Warning: loading a configuration file which hold configurations for a previous loaded gem,
    #          will cause the previous configuration to be lost.
    #
    #
    # @param filename: the file to load the configuration.
    #
    def self.load filename

      raise ArgumentError, "File #{filename} does not exist!" if !File.exist? filename

      if @@configurations.nil?
        # load configuration
        @@configurations = YAML.load_file(filename)
      else
        # merge existing configurations
        YAML.load_file(filename).each {|key, value|
          @@configurations[key] = value
        }
      end

      # TODO: for each gem name, store from which file the configuration was loaded...

    end



    # Returns the configuration for the given gem.
    #
    # @param name: the name of the gem.
    #
    def self.configuration_for_gem name
      @@configurations[:"#{name}"]
    end

  end
end