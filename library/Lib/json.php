<?php
class json_Lib
{

	public function encode($value)
	{
		return $this->_encodeValue($value);
	}

	protected function _encodeValue(&$value)
	{
		if (is_array($value)) {
			return $this->_encodeArray($value);
		}
		return $this->_encodeDatum($value);
	}

	protected function _encodeArray(&$array)
	{
		$tmpArray = array();
		if (!empty($array) && (array_keys($array) !== range(0, count($array) - 1))) {
			$result = '{';
			foreach ($array as $key => $value) {
				$key = (string) $key;
				$tmpArray[] = $this->_encodeString($key)
							. ':'
							. $this->_encodeValue($value);
			}
			$result .= implode(',', $tmpArray);
			$result .= '}';
		} else {
			$result = '[';
			$length = count($array);
			for ($i = 0; $i < $length; $i++) {
				$tmpArray[] = $this->_encodeValue($array[$i]);
			}
			$result .= implode(',', $tmpArray);
			$result .= ']';
		}
		return $result;
	}

	protected function _encodeDatum(&$value)
	{
		$result = 'null';

		if (is_int($value) || is_float($value)) {
			$result = (string) $value;
			$result = str_replace(",", ".", $result);
		} elseif (is_string($value)) {
			$result = $this->_encodeString($value);
		} elseif (is_bool($value)) {
			$result = $value ? 'true' : 'false';
		}

		return $result;
	}


	protected function _encodeString(&$string)
	{
		$search  = array('\\', "\n", "\t", "\r", "\b", "\f", '"');
		$replace = array('\\\\', '\\n', '\\t', '\\r', '\\b', '\\f', '\"');
		$string  = str_replace($search, $replace, $string);
		return '"' . $string . '"';
	}
}

