package phatntt.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;
import lombok.Builder;

@Data 
@NoArgsConstructor 
@AllArgsConstructor 
@Builder
public class RequestCancellationDTO {
 
    private int id;
    private String userId;
    private String name;
    private String email;
    private String phone;
    private String orderId;
    private String reason;
    private boolean requestStatus;
    private Timestamp createdAt;
    
}
