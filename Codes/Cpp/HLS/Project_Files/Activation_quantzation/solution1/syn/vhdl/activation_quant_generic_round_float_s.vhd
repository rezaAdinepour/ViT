-- ==============================================================
-- Generated by Vitis HLS v2023.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- ==============================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity activation_quant_generic_round_float_s is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    ap_ce : IN STD_LOGIC;
    x : IN STD_LOGIC_VECTOR (31 downto 0);
    ap_return : OUT STD_LOGIC_VECTOR (31 downto 0) );
end;


architecture behav of activation_quant_generic_round_float_s is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv32_17 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010111";
    constant ap_const_lv32_1E : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011110";
    constant ap_const_lv8_7E : STD_LOGIC_VECTOR (7 downto 0) := "01111110";
    constant ap_const_lv8_96 : STD_LOGIC_VECTOR (7 downto 0) := "10010110";
    constant ap_const_lv32_1B : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011011";
    constant ap_const_lv32_1F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011111";
    constant ap_const_lv31_0 : STD_LOGIC_VECTOR (30 downto 0) := "0000000000000000000000000000000";
    constant ap_const_lv23_7FFFFF : STD_LOGIC_VECTOR (22 downto 0) := "11111111111111111111111";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (0 downto 0) := "1";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC;
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal ap_idle_pp0 : STD_LOGIC;
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal mask_table_address0 : STD_LOGIC_VECTOR (4 downto 0);
    signal mask_table_ce0 : STD_LOGIC;
    signal mask_table_q0 : STD_LOGIC_VECTOR (22 downto 0);
    signal one_half_table_address0 : STD_LOGIC_VECTOR (4 downto 0);
    signal one_half_table_ce0 : STD_LOGIC;
    signal one_half_table_q0 : STD_LOGIC_VECTOR (23 downto 0);
    signal x_read_reg_200 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal data_1_fu_72_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal data_1_reg_205 : STD_LOGIC_VECTOR (31 downto 0);
    signal icmp_ln167_fu_86_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln167_reg_211 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln170_fu_92_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln170_reg_217 : STD_LOGIC_VECTOR (0 downto 0);
    signal zext_ln179_fu_108_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal xs_exp_fu_76_p4 : STD_LOGIC_VECTOR (7 downto 0);
    signal index_fu_98_p4 : STD_LOGIC_VECTOR (4 downto 0);
    signal xs_sign_fu_114_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal zext_ln175_fu_129_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal data_fu_133_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal trunc_ln301_fu_138_p1 : STD_LOGIC_VECTOR (22 downto 0);
    signal xor_ln184_fu_142_p2 : STD_LOGIC_VECTOR (22 downto 0);
    signal tmp_fu_154_p4 : STD_LOGIC_VECTOR (8 downto 0);
    signal xs_sig_fu_148_p2 : STD_LOGIC_VECTOR (22 downto 0);
    signal t_fu_121_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal t_2_fu_164_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal select_ln167_fu_172_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal xor_ln167_fu_183_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln170_fu_188_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal bitcast_ln167_fu_179_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_idle_pp0_0to0 : STD_LOGIC;
    signal ap_reset_idle_pp0 : STD_LOGIC;
    signal ap_enable_pp0 : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component activation_quant_generic_round_float_s_mask_table_ROM_AUTO_1R IS
    generic (
        DataWidth : INTEGER;
        AddressRange : INTEGER;
        AddressWidth : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR (4 downto 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR (22 downto 0) );
    end component;


    component activation_quant_generic_round_float_s_one_half_table_ROM_AUTO_1R IS
    generic (
        DataWidth : INTEGER;
        AddressRange : INTEGER;
        AddressWidth : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR (4 downto 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR (23 downto 0) );
    end component;



begin
    mask_table_U : component activation_quant_generic_round_float_s_mask_table_ROM_AUTO_1R
    generic map (
        DataWidth => 23,
        AddressRange => 32,
        AddressWidth => 5)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        address0 => mask_table_address0,
        ce0 => mask_table_ce0,
        q0 => mask_table_q0);

    one_half_table_U : component activation_quant_generic_round_float_s_one_half_table_ROM_AUTO_1R
    generic map (
        DataWidth => 24,
        AddressRange => 32,
        AddressWidth => 5)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        address0 => one_half_table_address0,
        ce0 => one_half_table_ce0,
        q0 => one_half_table_q0);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter1_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
            else
                if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    ap_enable_reg_pp0_iter1 <= ap_start;
                end if; 
            end if;
        end if;
    end process;

    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_ce) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                data_1_reg_205 <= data_1_fu_72_p1;
                icmp_ln167_reg_211 <= icmp_ln167_fu_86_p2;
                icmp_ln170_reg_217 <= icmp_ln170_fu_92_p2;
                x_read_reg_200 <= x;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_CS_fsm, ap_block_pp0_stage0_subdone, ap_reset_idle_pp0)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_pp0_stage0 => 
                ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
            when others =>  
                ap_NS_fsm <= "X";
        end case;
    end process;
    and_ln170_fu_188_p2 <= (xor_ln167_fu_183_p2 and icmp_ln170_reg_217);
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(0);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_11001 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_pp0_stage0_subdone_assign_proc : process(ap_ce)
    begin
                ap_block_pp0_stage0_subdone <= (ap_const_logic_0 = ap_ce);
    end process;


    ap_done_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_subdone)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;

    ap_enable_pp0 <= (ap_idle_pp0 xor ap_const_logic_1);
    ap_enable_reg_pp0_iter0 <= ap_start;

    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, ap_idle_pp0)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_idle_pp0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1)
    begin
        if (((ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0))) then 
            ap_idle_pp0 <= ap_const_logic_1;
        else 
            ap_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_0to0_assign_proc : process(ap_enable_reg_pp0_iter0)
    begin
        if ((ap_enable_reg_pp0_iter0 = ap_const_logic_0)) then 
            ap_idle_pp0_0to0 <= ap_const_logic_1;
        else 
            ap_idle_pp0_0to0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_subdone)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    ap_reset_idle_pp0_assign_proc : process(ap_start, ap_idle_pp0_0to0)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_idle_pp0_0to0 = ap_const_logic_1))) then 
            ap_reset_idle_pp0 <= ap_const_logic_1;
        else 
            ap_reset_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;

    ap_return <= 
        x_read_reg_200 when (and_ln170_fu_188_p2(0) = '1') else 
        bitcast_ln167_fu_179_p1;
    bitcast_ln167_fu_179_p1 <= select_ln167_fu_172_p3;
    data_1_fu_72_p1 <= x;
    data_fu_133_p2 <= std_logic_vector(unsigned(zext_ln175_fu_129_p1) + unsigned(data_1_reg_205));
    icmp_ln167_fu_86_p2 <= "1" when (unsigned(xs_exp_fu_76_p4) < unsigned(ap_const_lv8_7E)) else "0";
    icmp_ln170_fu_92_p2 <= "1" when (unsigned(xs_exp_fu_76_p4) > unsigned(ap_const_lv8_96)) else "0";
    index_fu_98_p4 <= data_1_fu_72_p1(27 downto 23);
    mask_table_address0 <= zext_ln179_fu_108_p1(5 - 1 downto 0);

    mask_table_ce0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_ce, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_ce) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            mask_table_ce0 <= ap_const_logic_1;
        else 
            mask_table_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    one_half_table_address0 <= zext_ln179_fu_108_p1(5 - 1 downto 0);

    one_half_table_ce0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_ce, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_ce) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            one_half_table_ce0 <= ap_const_logic_1;
        else 
            one_half_table_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    select_ln167_fu_172_p3 <= 
        t_fu_121_p3 when (icmp_ln167_reg_211(0) = '1') else 
        t_2_fu_164_p3;
    t_2_fu_164_p3 <= (tmp_fu_154_p4 & xs_sig_fu_148_p2);
    t_fu_121_p3 <= (xs_sign_fu_114_p3 & ap_const_lv31_0);
    tmp_fu_154_p4 <= data_fu_133_p2(31 downto 23);
    trunc_ln301_fu_138_p1 <= data_fu_133_p2(23 - 1 downto 0);
    xor_ln167_fu_183_p2 <= (icmp_ln167_reg_211 xor ap_const_lv1_1);
    xor_ln184_fu_142_p2 <= (mask_table_q0 xor ap_const_lv23_7FFFFF);
    xs_exp_fu_76_p4 <= data_1_fu_72_p1(30 downto 23);
    xs_sig_fu_148_p2 <= (xor_ln184_fu_142_p2 and trunc_ln301_fu_138_p1);
    xs_sign_fu_114_p3 <= data_1_reg_205(31 downto 31);
    zext_ln175_fu_129_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(one_half_table_q0),32));
    zext_ln179_fu_108_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(index_fu_98_p4),64));
end behav;
