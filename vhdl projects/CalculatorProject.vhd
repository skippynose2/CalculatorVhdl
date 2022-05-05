--- Libraries needed to have certain features
library IEEE;
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_1164.all;

ENTITY CalculatorProject IS
PORT (
	digit1 : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
	digit2 : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
	addition : IN BIT;
	subtraction : IN BIT;
	multiplication : IN BIT;
	division : IN BIT;
	LED_out : OUT BIT_VECTOR (6 DOWNTO 0);
	LED_out2 : OUT BIT_VECTOR (6 DOWNTO 0);
	LED_out3 : OUT BIT_VECTOR (6 DOWNTO 0));

END CalculatorProject;


ARCHITECTURE Logic OF CalculatorProject IS
	SIGNAL temp : integer;
	SIGNAL number : integer; -- the answer
	SIGNAL dig1 : integer; -- The two numbers
	SIGNAL dig2 : integer; -- The two numbers
	BEGIN
	
	-- Process to handle the arthmitic
	PROCESS (digit1, digit2, addition, subtraction, multiplication, division)
	BEGIN
		-- Converts the logic vectors to integers to have operation done on them
		dig1 <= to_integer(unsigned(digit1));
		dig2 <= to_integer(unsigned(digit2));
		
		-- Does the addition logic if the addition button is pressed
		IF (addition = '0') THEN
			number <= dig1 + dig2;
		END IF;
		
		-- Does the substraction logic if the subtraction button is pressed
		IF (subtraction = '0') THEN
			IF ((dig1 - dig2) >= 0) THEN
				number <= dig1 - dig2;
			ELSE
				number <= 0;
			END IF;
		END IF;	

		-- Multiplication logic
		IF (multiplication = '0') THEN
			number <= dig1 * dig2;
		END IF;
		
		IF (division = '0') THEN
			IF (dig2 > 0) THEN
				IF ((dig1 MOD dig2) = 0) THEN
					number <= dig1 / dig2;
				ELSE
					number <= 0;
				END IF;
				ELSE
					number <= 0;
			END IF;
		END IF;
	END PROCESS;
	
	


END Logic;
