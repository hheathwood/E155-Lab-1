if {[catch {

# define run engine funtion
source [file join {C:/lscc/radiant/2024.1} scripts tcl flow run_engine.tcl]
# define global variables
global para
set para(gui_mode) "1"
set para(prj_dir) "C:/Users/hheathwood/Desktop/Henry MicroPs/E155-Lab-1/fpga/radiant_project"
# synthesize IPs
# synthesize VMs
# synthesize top design
file delete -force -- E155_Lab1_impl_1.vm E155_Lab1_impl_1.ldc
::radiant::runengine::run_engine_newmsg synthesis -f "E155_Lab1_impl_1_lattice.synproj" -logfile "E155_Lab1_impl_1_lattice.srp"
::radiant::runengine::run_postsyn [list -a iCE40UP -p iCE40UP5K -t SG48 -sp High-Performance_1.2V -oc Industrial -top -w -o E155_Lab1_impl_1_syn.udb E155_Lab1_impl_1.vm] [list {C:/Users/hheathwood/Desktop/Henry MicroPs/E155-Lab-1/fpga/radiant_project/impl_1/E155_Lab1_impl_1.ldc}]

} out]} {
   ::radiant::runengine::runtime_log $out
   exit 1
}
