<project xmlns="com.autoesl.autopilot.project" name="Weight_quantization" top="weight_quant" projectType="C/C++">
    <includePaths/>
    <libraryPaths/>
    <Simulation>
        <SimFlow name="csim" csimMode="0" lastCsimMode="0"/>
    </Simulation>
    <files xmlns="">
        <file name="Weight_quantization/src/weight_quant.cpp" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="Weight_quantization/src/weight_quant.h" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="../src/tb_weight_quant.cpp" sc="0" tb="1" cflags="-Wno-unknown-pragmas" csimflags="" blackbox="false"/>
        <file name="../src/tb_weight_quant.h" sc="0" tb="1" cflags="-Wno-unknown-pragmas" csimflags="" blackbox="false"/>
    </files>
    <solutions xmlns="">
        <solution name="solution1" status="active"/>
    </solutions>
</project>

