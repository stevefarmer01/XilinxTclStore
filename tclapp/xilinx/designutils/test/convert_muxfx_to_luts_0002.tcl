# Set the File Directory to the current directory location of the script
set file_dir [file normalize [file dirname [info script]]]
set unit_test [file rootname [file tail [info script]]]

# Set the Xilinx Tcl App Store Repository to the current repository location
puts "== Unit Test directory: $file_dir"
puts "== Unit Test name: $unit_test"

# Set the Name to the name of the script
set name [file rootname [file tail [info script]]]

# Load the Design Checkpoint for the specific test
open_checkpoint "$file_dir/src/convert_muxfx_to_luts/convert_muxfx_to_luts_0001.dcp"

# Run the write_slr_pblock_xdc script and verify that no error was reported
if {[catch { ::tclapp::xilinx::designutils::convert_muxfx_to_luts -cell inst} catchErrorString]} {
    close_design
    error [format " -E- Unit test $name failed: %s" $catchErrorString]   
}

close_design

return 0
