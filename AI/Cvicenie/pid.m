function u = pid(e,P,I,D)
   %PID Proportional-integral-derivative controller.
    %
    %   U = PID(E, KP, KI, KD) calculates the PID output (u) from the error (e),
    %   using the given proportional gain (Kp), integral gain (Ki), and derivative
    %   gain (Kd).
    %
    %   Inputs:
    %
    %     E: The error signal.
    %     KP: The proportional gain.
    %     KI: The integral gain.
    %     KD: The derivative gain.
    %
    %   Outputs:
    %
    %     U: The PID output signal.
    
    % Calculate the proportional term.
    u_p = P * e;

    % Calculate the integral term.
    u_i = I * e;
    
    % Calculate the derivative term.
    u_d = D * e;
    
    % Calculate the total PID output.
    u = u_p + u_i + u_d;
    
end