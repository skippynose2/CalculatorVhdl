ENTITY CalculatorProject IS
PORT (
	digit1 : IN BIT_VECTOR (1 DOWNTO 0);
	digit2 : IN BIT_VECTOR (1 DOWNTO 0);
	LED_out : OUT BIT_VECTOR (6 DOWNTO 0));

END CalculatorProject;


ARCHITECTURE Logic OF CalculatorProject IS
	SIGNAL number
	BEGIN
	PROCESS (digit1, digit2, LED_out)
		
	END PROCESS;
END Logic;