package Security;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.spec.KeySpec;
import java.util.Random;
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

// RSA 공개키 암호
import java.security.KeyPair; 
import java.security.KeyPairGenerator;

public class Security {
	
	public static Security instance = new Security();
	
	// AES 대칭 암호화 변수
	private Cipher aes_cipher;
	
	private static final String aes_key = "sikddorack";
	private static final String MODE = "AES/CBC/PKCS5Padding";
    
    private static String iv = "2fad5a477d13ecda7f718fbd8a9f0443";
	
    
    // RSA 공개키 암호 변수
    private Cipher rsa_cipher;
    
    KeyPairGenerator clsKeyPairGenerator;
    KeyPair clsKeyPair; // 두개의 키(공개키, 개인키)를 갖고 있는 변수
    public Key public_key; // 공개키
    private Key private_key; // 개인키
	
    Security() {
		try {
			// AES에 사용할 변수 할당
			InitAES();
			
			// RSA 공개키/개인키를 생성
			InitRSA();
			
			rsa_cipher = Cipher.getInstance("RSA/None/NoPadding");
			
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
    
    private String Encrypt(String aes_key, String data, String iv) throws Exception {
    	SecretKey key = GenerateKey(aes_key);
    	System.out.println("Key : " + key);
    	System.out.println("Encrypt Key : " + aes_key);
        byte[] encrypted = DoFinal(Cipher.ENCRYPT_MODE, key, iv, data.getBytes("UTF-8"));
        String cipher_data = aes_key + "=back52=gwon39=kim78=" + EncodeBase64(encrypted) +"=back52=gwon39=kim78="+iv;
        System.out.println("Encrypt Cipher Data : " + cipher_data);
        return cipher_data;
    }
    
    public String Decrypt(String data) throws Exception {
    	String all[] = data.split("=back52=gwon39=kim78=");
    	String aes_key = all[0];
    	String cipher_data = all[1];
    	String iv = all[2];
    	
    	System.out.println("Decrypt Key : " + aes_key);
    	
        return Decrypt(aes_key, iv, cipher_data);
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
    
    public String CreateIV() {
    	char[] IV = null;
   
        StringBuilder buffer = new StringBuilder();
        for (char ch = '0'; ch <= '9'; ++ch)
            buffer.append(ch);
        for (char ch = 'a'; ch <= 'f'; ++ch)
            buffer.append(ch);

        IV = buffer.toString().toCharArray();
        
    	
    	StringBuilder randomString = new StringBuilder();
        Random random = new Random();
        
        for (int i = 0; i < 32; i++) {
            randomString.append(IV[random.nextInt(IV.length)]);
        }
        return randomString.toString();
    }
    
    public String CreateKey() {
    	char[] key = null;
   
        StringBuilder buffer = new StringBuilder();
        for (char ch = '0'; ch <= '9'; ++ch)
            buffer.append(ch);
        for (char ch = 'a'; ch <= 'f'; ++ch)
            buffer.append(ch);

        key = buffer.toString().toCharArray();
        
    	
    	StringBuilder randomString = new StringBuilder();
        Random random = new Random();
        
        for (int i = 0; i < 10; i++) {
            randomString.append(key[random.nextInt(key.length)]);
        }
        return randomString.toString();
    }

    
    //RSA
    public void InitRSA() {
		try {
			clsKeyPairGenerator = KeyPairGenerator.getInstance("RSA");
			
			clsKeyPairGenerator.initialize(1024);
			clsKeyPair = clsKeyPairGenerator.genKeyPair();
			public_key = clsKeyPair.getPublic();
			private_key = clsKeyPair.getPrivate();
			
			rsa_cipher = Cipher.getInstance("RSA");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
    
    public String EnKey(String aes_key, Key public_key) {
    	try {
			rsa_cipher.init(Cipher.ENCRYPT_MODE, public_key);
			byte[] cipher_data = rsa_cipher.doFinal(aes_key.getBytes());
			String cipher_key = new String(cipher_data); 
			return cipher_key;
		} catch (Exception e) {
			e.printStackTrace();
		}
    	return "";
    }
    
    public String DeKey(String cipher_key) {
    	try {
			rsa_cipher.init(Cipher.DECRYPT_MODE, private_key);
			byte[] key_data = rsa_cipher.doFinal(cipher_key.getBytes());
			String aes_key = new String(key_data);
			return aes_key;
		} catch (Exception e) {
			e.printStackTrace();
		}
    	return "";
    }
    

    // Method
    public Reservation EnReser(String aes_key, Reservation reser, String iv){
    	Reservation en_reser = new Reservation();
    	
    	try {
			en_reser.setCus_id(Security.instance.Encrypt(aes_key, reser.getCus_id(), iv));
			en_reser.setSto_id(Security.instance.Encrypt(aes_key, reser.getSto_id(), iv));
			en_reser.setRes_date(Security.instance.Encrypt(aes_key, reser.getRes_date(), iv));
			en_reser.setCus_phone(Security.instance.Encrypt(aes_key, reser.getCus_phone(), iv));
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
