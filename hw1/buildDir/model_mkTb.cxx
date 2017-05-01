/*
 * Generated by Bluespec Compiler, version 2016.07.beta1 (build 34806, 2016-07-05)
 * 
 * On Mon Apr 17 22:48:15 PDT 2017
 * 
 */
#include "bluesim_primitives.h"
#include "model_mkTb.h"

#include <cstdlib>
#include <time.h>
#include "bluesim_kernel_api.h"
#include "bs_vcd.h"
#include "bs_reset.h"


/* Constructor */
MODEL_mkTb::MODEL_mkTb()
{
  mkTb_instance = NULL;
}

/* Function for creating a new model */
void * new_MODEL_mkTb()
{
  MODEL_mkTb *model = new MODEL_mkTb();
  return (void *)(model);
}

/* Schedule functions */

static void schedule_posedge_CLK(tSimStateHdl simHdl, void *instance_ptr)
       {
	 MOD_mkTb &INST_top = *((MOD_mkTb *)(instance_ptr));
	 tUInt8 DEF_INST_top_DEF_started___d1;
	 tUInt8 DEF_INST_top_DEF_CAN_FIRE_RL_start;
	 tUInt8 DEF_INST_top_DEF_WILL_FIRE_RL_start;
	 tUInt8 DEF_INST_top_DEF_CAN_FIRE_RL_count;
	 tUInt8 DEF_INST_top_DEF_WILL_FIRE_RL_count;
	 tUInt8 DEF_INST_top_DEF_CAN_FIRE_RL_print;
	 tUInt8 DEF_INST_top_DEF_WILL_FIRE_RL_print;
	 tUInt8 DEF_INST_top_DEF_CAN_FIRE_RL_finish;
	 tUInt8 DEF_INST_top_DEF_WILL_FIRE_RL_finish;
	 DEF_INST_top_DEF_started___d1 = INST_top.INST_started.METH_read();
	 DEF_INST_top_DEF_CAN_FIRE_RL_count = DEF_INST_top_DEF_started___d1;
	 DEF_INST_top_DEF_WILL_FIRE_RL_count = DEF_INST_top_DEF_CAN_FIRE_RL_count;
	 INST_top.DEF_cnt__h270 = INST_top.INST_cnt.METH_read();
	 DEF_INST_top_DEF_CAN_FIRE_RL_finish = (INST_top.DEF_cnt__h270) == (tUInt8)8u && DEF_INST_top_DEF_started___d1;
	 DEF_INST_top_DEF_WILL_FIRE_RL_finish = DEF_INST_top_DEF_CAN_FIRE_RL_finish;
	 DEF_INST_top_DEF_CAN_FIRE_RL_print = (INST_top.DEF_cnt__h270) < (tUInt8)8u && DEF_INST_top_DEF_started___d1;
	 DEF_INST_top_DEF_WILL_FIRE_RL_print = DEF_INST_top_DEF_CAN_FIRE_RL_print;
	 DEF_INST_top_DEF_CAN_FIRE_RL_start = !DEF_INST_top_DEF_started___d1;
	 DEF_INST_top_DEF_WILL_FIRE_RL_start = DEF_INST_top_DEF_CAN_FIRE_RL_start;
	 if (DEF_INST_top_DEF_WILL_FIRE_RL_finish)
	   INST_top.RL_finish();
	 if (DEF_INST_top_DEF_WILL_FIRE_RL_print)
	   INST_top.RL_print();
	 if (DEF_INST_top_DEF_WILL_FIRE_RL_count)
	   INST_top.RL_count();
	 if (DEF_INST_top_DEF_WILL_FIRE_RL_start)
	   INST_top.RL_start();
	 if (do_reset_ticks(simHdl))
	 {
	   INST_top.INST_cnt.rst_tick__clk__1((tUInt8)1u);
	   INST_top.INST_started.rst_tick__clk__1((tUInt8)1u);
	 }
       };

/* Model creation/destruction functions */

void MODEL_mkTb::create_model(tSimStateHdl simHdl, bool master)
{
  sim_hdl = simHdl;
  init_reset_request_counters(sim_hdl);
  mkTb_instance = new MOD_mkTb(sim_hdl, "top", NULL);
  bk_get_or_define_clock(sim_hdl, "CLK");
  if (master)
  {
    bk_alter_clock(sim_hdl, bk_get_clock_by_name(sim_hdl, "CLK"), CLK_LOW, false, 0llu, 5llu, 5llu);
    bk_use_default_reset(sim_hdl);
  }
  bk_set_clock_event_fn(sim_hdl,
			bk_get_clock_by_name(sim_hdl, "CLK"),
			schedule_posedge_CLK,
			NULL,
			(tEdgeDirection)(POSEDGE));
  (mkTb_instance->set_clk_0)("CLK");
}
void MODEL_mkTb::destroy_model()
{
  delete mkTb_instance;
  mkTb_instance = NULL;
}
void MODEL_mkTb::reset_model(bool asserted)
{
  (mkTb_instance->reset_RST_N)(asserted ? (tUInt8)0u : (tUInt8)1u);
}
void * MODEL_mkTb::get_instance()
{
  return mkTb_instance;
}

/* Fill in version numbers */
void MODEL_mkTb::get_version(unsigned int *year,
			     unsigned int *month,
			     char const **annotation,
			     char const **build)
{
  *year = 2016u;
  *month = 7u;
  *annotation = "beta1";
  *build = "34806";
}

/* Get the model creation time */
time_t MODEL_mkTb::get_creation_time()
{
  
  /* Tue Apr 18 05:48:15 UTC 2017 */
  return 1492494495llu;
}

/* Control run-time licensing */
tUInt64 MODEL_mkTb::skip_license_check()
{
  return 0llu;
}

/* State dumping function */
void MODEL_mkTb::dump_state()
{
  (mkTb_instance->dump_state)(0u);
}

/* VCD dumping functions */
MOD_mkTb & mkTb_backing(tSimStateHdl simHdl)
{
  static MOD_mkTb *instance = NULL;
  if (instance == NULL)
  {
    vcd_set_backing_instance(simHdl, true);
    instance = new MOD_mkTb(simHdl, "top", NULL);
    vcd_set_backing_instance(simHdl, false);
  }
  return *instance;
}
void MODEL_mkTb::dump_VCD_defs()
{
  (mkTb_instance->dump_VCD_defs)(vcd_depth(sim_hdl));
}
void MODEL_mkTb::dump_VCD(tVCDDumpType dt)
{
  (mkTb_instance->dump_VCD)(dt, vcd_depth(sim_hdl), mkTb_backing(sim_hdl));
}
