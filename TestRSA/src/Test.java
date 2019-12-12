import java.security.Key;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.util.Random;

import javax.crypto.Cipher; 

public class Test {
	
    public static String CreateKey() {
    	char[] key = null;
   
        StringBuilder buffer = new StringBuilder();
        for (char ch = '0'; ch <= '9'; ++ch)
            buffer.append(ch);
        for (char ch = 'a'; ch <= 'f'; ++ch)
            buffer.append(ch);

        key = buffer.toString().toCharArray();
        
    	
    	StringBuilder randomString = new StringBuilder();
        Random random = new Random();
        
        for (int i = 0; i < 5; i++) {
            randomString.append(key[random.nextInt(key.length)]);
        }
        return randomString.toString();
    }
    
	public static void main(String[] args) {
		try
		{
			// RSA ����Ű/����Ű�� �����Ѵ�. 
			KeyPairGenerator clsKeyPairGenerator = KeyPairGenerator.getInstance("RSA");
			clsKeyPairGenerator.initialize(1024);
			KeyPair clsKeyPair = clsKeyPairGenerator.genKeyPair();
			Key clsPublicKey = clsKeyPair.getPublic();
			Key clsPrivateKey = clsKeyPair.getPrivate();
			// ��ȣȭ �Ѵ�. 
			String[] strPinNumber = new String[5];
			Cipher clsCipher = null;
			for(int i = 0; i < 5; i++) {
				strPinNumber[i] = CreateKey();
				System.out.println(i + "��° Ű : " + strPinNumber[i]);
			}
			for(int i = 0; i < 5; i++) {
				clsCipher = Cipher.getInstance("RSA");
				clsCipher.init( Cipher.ENCRYPT_MODE, clsPublicKey );
				byte[] arrCipherData = clsCipher.doFinal( strPinNumber[i].getBytes( ));
				strPinNumber[i] = new String( arrCipherData );
				System.out.println( "cipher(" + strPinNumber[i] + ") ���̴� " + strPinNumber[i].length());
				// ��ȣȭ �Ѵ�. 
				clsCipher.init( Cipher.DECRYPT_MODE, clsPrivateKey );
				byte[] arrData = clsCipher.doFinal( arrCipherData );
				String strResult = new String( arrData );
				System.out.println( "result(" + strResult + ")" );
			}
			
			// ��ȣȭ �Ѵ�. 
			for(int i = 0; i < 5; i++) {
				clsCipher.init( Cipher.DECRYPT_MODE, clsPrivateKey );
				byte[] arrData = clsCipher.doFinal( strPinNumber[i].getBytes());
				strPinNumber[i] = new String( arrData );
				System.out.println( "result(" + strPinNumber[i] + ")" );
			}
		} catch( Exception e ) { 

		}
	}
}
