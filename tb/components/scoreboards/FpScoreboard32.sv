class FpScoreboard32 #(type T);
    TriggerableQueue #(T) in_queue_dut;
    TriggerableQueue #(T) in_queue_golden;

    function new(
        TriggerableQueue #(T) in_queue_dut,
        TriggerableQueue #(T) in_queue_golden
    );
        this.in_queue_dut = in_queue_dut;
        this.in_queue_golden = in_queue_golden;
    endfunction

    task automatic run();
        T floating_points_dut;
        T floating_points_golden;
        forever begin
            floating_points_dut = in_queue_dut.pop();
            floating_points_golden = in_queue_golden.pop();
            if(floating_points_golden.r == floating_points_dut.r) begin
                $display("Yay");
            end else begin
                $display("Error");
            end
        end

    endtask
endclass