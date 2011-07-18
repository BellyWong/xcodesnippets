require 'clamp/command'
require 'xcode_snippets/snippet_manager'

module XcodeSnippets
  class Main < Clamp::Command

    subcommand "install", "Install a single snippet" do
      parameter "FILE ...", "Path to code snippet to install"
      
      def execute
        manager.install_snippets_from_paths(file_list)
      end
    end
    
    subcommand "install-bundle", "Install a snippet bundle" do
      parameter "FILE", "Name of the installed snippet"
      
      def execute
        manager.install_snippet_bundle(file)
      end
    end
    
    subcommand "uninstall", "Uninstall a snippet or snippet bundle" do
      parameter "NAME", "Name of the installed snippet"
      
      def execute
        manager.uninstall_snippet_named(name)
      end
    end
    
    private
    
    def manager
      XcodeSnippets::SnippetManager.new(manifest)
    end
    
    def manifest
      Manifest.load(XcodeSnippets.installation_path, XcodeSnippets.xcode_snippets_path)
    end

  end
end
