package Security;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.spec.KeySpec;
import java.io.UnsupportedEncodingException;
import java.security.InvalidKeyException;
import java.security.Key;
 
import javax.crypto.Cipher;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.PBEKeySpec;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.codec.binary.Hex;

import Infomation.Reservation;

// RSA ����Ű ��ȣ
import java.security.KeyPair; 
import java.security.KeyPairGenerator;

public class Security {
	
	public static Security instance = new Security();
	
	// AES ��Ī ��ȣȭ ����
	private Cipher aes_cipher;
	
	private static final String aes_key = "sikddorack";
	private static final String MODE = "AES/CBC/PKCS5Padding";
    
    private static String iv = "2fad5a477d13ecda7f718fbd8a9f0443";
	
    
    // RSA ����Ű ��ȣ ����
    KeyPairGenerator clsKeyPairGenerator;
    KeyPair clsKeyPair; // �ΰ��� Ű(����Ű, ����Ű)�� ���� �ִ� ����
    public Key public_key; // ����Ű
    private Key private_key; // ����Ű
	
    Security() {
		try {
			// AES�� ����� ���� �Ҵ�
			InitAES();
			
			// RSA ����Ű/����Ű�� ����
			InitRSA();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

    public static String Sha256(String msg) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        md.update(msg.getBytes());
        
        return BytesToHex(md.digest());
    }
 
    public static String BytesToHex(byte[] bytes) {
        StringBuilder builder = new StringBuilder();
        for (byte b: bytes) {
          builder.append(String.format("%02x", b));
        }
        return builder.toString();
    }
    
    // AES   
    public void InitAES() {
		try {
			aes_cipher = Cipher.getInstance(MODE);
		} catch (Exception e) {
			e.printStackTrace();
		}
    }
    
    public SecretKey GenerateKey(String aes_key) throws Exception {

        byte[] keyBytes = new byte[16];
        byte[] b = aes_key.getBytes("UTF-8");

        int len = b.length;
        if (len > keyBytes.length) {
           len = keyBytes.length;
        }

        System.arraycopy(b, 0, keyBytes, 0, len);
        SecretKey key = new SecretKeySpec(keyBytes, "AES");
        return key;
    }

    public String Encrypt(String data, String aes_key, Key public_key) throws Exception {
        String en_key = EnKey(aes_key);
        String en_data = Encrypt(aes_key ,iv, data);
        String cipher_data = en_key + "()" + en_data;
        System.out.println("��ȣȭ�� ���� : " + cipher_data );
        return cipher_data;
    }
    
    
    public String Decrypt(String data) throws Exception {
    	String textes[] = data.split("()");
    	String aes_key = DeKey(textes[0]);
    	String cipher_data = textes[1];
    	System.out.println("��ȣȭ�� ����Ű�� " + aes_key);
        return Decrypt(aes_key, iv, cipher_data);
    }
    
    
    private String Encrypt(String aes_key, String iv, String data) throws Exception {
    	SecretKey key = GenerateKey(aes_key);
        byte[] encrypted = DoFinal(Cipher.ENCRYPT_MODE, key, iv, data.getBytes("UTF-8"));
        return EncodeBase64(encrypted);
    }

    
    private String Decrypt(String aes_key, String iv, String cipher_data) throws Exception {
    	SecretKey key = GenerateKey(aes_key);
        byte[] decrypted = DoFinal(Cipher.DECRYPT_MODE, key, iv, DecodeBase64(cipher_data));
        return new String(decrypted, "UTF-8");
    }
    
    private byte[] DoFinal(int encryptMode, SecretKey key, String iv, byte[] bytes) throws Exception {
        aes_cipher.init(encryptMode, key, new IvParameterSpec(DecodeHex(iv)));
        return aes_cipher.doFinal(bytes);
    }
    
    private static byte[] DecodeHex(String str) throws Exception {
        return Hex.decodeHex(str.toCharArray());
    }
    
    private static String EncodeBase64(byte[] bytes) {
        return Base64.encodeBase64String(bytes);
    }

    
    private static byte[] DecodeBase64(String str) {
        return Base64.decodeBase64(str);
    }

    
    //RSA
    public void InitRSA() {
		try {
			clsKeyPairGenerator = KeyPairGenerator.getInstance("RSA");
			
			clsKeyPairGenerator.initialize(1024);
			clsKeyPair = clsKeyPairGenerator.genKeyPair();
			public_key = clsKeyPair.getPublic();
			private_key = clsKeyPair.getPrivate();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
    
    public String EnKey(String key) {
    	try {
    		Cipher cipher = Cipher.getInstance("RSA");
    		cipher.init(Cipher.ENCRYPT_MODE, this.public_key);
			byte[] cipher_data = cipher.doFinal(key.getBytes());
			String cipher_key = new String(cipher_data);
			System.out.println("Cipher Key : " + cipher_key);
			return cipher_key;
		} catch (Exception e) {
			e.printStackTrace();
		}
    	return "";
    }
    
    public String DeKey(String cipher_key) {
    	try {
    		Cipher cipher = Cipher.getInstance("RSA");
    		cipher.init(Cipher.DECRYPT_MODE, private_key);
			byte[] key_data = cipher.doFinal(cipher_key.getBytes());
			String key = new String(key_data);
			return key;
		} catch (Exception e) {
			e.printStackTrace();
		}
    	return "";
    }
    

    // Method
    public Reservation EnReser(Reservation reser, String aes_key, Key public_key){
    	Reservation en_reser = new Reservation();
    	
    	try {
			en_reser.setCus_id(Security.instance.Encrypt(reser.getCus_id(), aes_key, public_key));
			en_reser.setSto_id(Security.instance.Encrypt(reser.getSto_id(), aes_key, public_key));
			en_reser.setRes_date(Security.instance.Encrypt(reser.getRes_date(), aes_key, public_key));
			en_reser.setCus_phone(Security.instance.Encrypt(reser.getCus_phone(), aes_key, public_key));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	en_reser.setSto_name(reser.getSto_name());
    	en_reser.setCus_count(reser.getCus_count());
    	
    	return en_reser;
    }
    
    public Reservation DeReser(Reservation reser){
    	Reservation de_reser = new Reservation();
    	
    	try {
    		de_reser.setCus_id(Security.instance.Decrypt(reser.getCus_id()));
    		de_reser.setSto_id(Security.instance.Decrypt(reser.getSto_id()));
    		de_reser.setRes_date(Security.instance.Decrypt(reser.getRes_date()));
    		de_reser.setCus_phone(Security.instance.Decrypt(reser.getCus_phone()));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	de_reser.setSto_name(reser.getSto_name());
    	de_reser.setCus_count(reser.getCus_count());
    	
    	return de_reser;
    }
}
