module LLVM
  module Support
    # @private
    module C
      extend FFI::Library
      support_lib = File.expand_path(
                      File.join(
                        File.dirname(__FILE__),
                        '../',
                        FFI.map_library_name('RubyLLVMSupport-2.9.2')))
      ffi_lib [support_lib]
      attach_function :LLVMLoadLibraryPermanently, [:string], :int
    end
  end

  def load_library(libname)
    0 == Support::C.LLVMLoadLibraryPermanently(libname)
  end

  module_function :load_library
end
