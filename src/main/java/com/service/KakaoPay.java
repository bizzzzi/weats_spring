package com.service;

import com.dto.KakaoPayApprovalDTO;
import com.dto.KakaoPayDTO;
import org.apache.taglibs.standard.lang.jstl.GreaterThanOrEqualsOperator;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import javax.servlet.http.HttpSession;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;
import java.util.Map;

@Service
public class KakaoPay {
    private static final String HOST = "https://kapi.kakao.com";

    private KakaoPayDTO kakaoPayDTO;
    private KakaoPayApprovalDTO kakaoPayApprovalDTO;

    public String kakaoPayReady(Map<String, String> map, List<String> item_title) {
        RestTemplate restTemplate = new RestTemplate();

        String reserveDay = map.get("reserveDay").toString();
        String totalPrice = map.get("totalPrice").toString();
        String user_name = map.get("rs_name").toString();
        String item_name = item_title.get(0)+" 외"+(item_title.size()-1);
        String quantity = map.get("totalPersonnelConut").toString();

        System.out.println(totalPrice);
        System.out.println(user_name);
        System.out.println(item_name);


        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "9878cbbff3c62606cc0c687926f0f79a");
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");

        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
        params.add("cid", "TC0ONETIME");
        params.add("partner_order_id", "1001");
//        params.add("partner_user_id", (String) map.get("rs_name"));
        params.add("partner_user_id", user_name);
//        params.add("item_name", item_title.get(0)+"외"+(item_title.size()-1));
        params.add("item_name", item_name);
        params.add("quantity", quantity);
        params.add("total_amount", totalPrice);
//        params.add("total_amount", (String)map.get("totalPrice"));
        params.add("tax_free_amount", "100");
        params.add("approval_url", "http://localhost:8080/weats/kakaoPaySuccess");
        params.add("cancel_url", "http://localhost:8080/weats/kakaoPayCancel");
        params.add("fail_url", "http://localhost:8080/weats/kakaoPaySuccessFail");

        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);

        try {
            kakaoPayDTO = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, KakaoPayDTO.class);
            System.out.println(kakaoPayDTO);

            return kakaoPayDTO.getNext_redirect_pc_url();

        } catch (RestClientException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (URISyntaxException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return "/pay";

    }

    public KakaoPayApprovalDTO kakaoPayInfo(String pg_token, Map<String, ?> map, List<String> item_title) {

        RestTemplate restTemplate = new RestTemplate();
        String totalPrice = map.get("totalPrice").toString();
        String user_name = map.get("rs_name").toString();
        String item_name = item_title.get(0)+" 외"+(item_title.size()-1);

        System.out.println(totalPrice);
        System.out.println(user_name);
        System.out.println(item_name);

        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "9878cbbff3c62606cc0c687926f0f79a");
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");

        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("tid", kakaoPayDTO.getTid());
        params.add("partner_order_id", "1001");
        params.add("partner_user_id", user_name);
        params.add("pg_token", pg_token);
        params.add("total_amount", totalPrice);

        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);

        try {
            kakaoPayApprovalDTO = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body, KakaoPayApprovalDTO.class);
            System.out.println(kakaoPayApprovalDTO);
            return kakaoPayApprovalDTO;

        } catch (RestClientException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (URISyntaxException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return null;
    }
}
