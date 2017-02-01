stop_servers(){

        PROJECT="kafka"
        kafka_instance_ids=$(aws ec2 describe-instances --filters "Name=tag:$PROJECT,Values=*" |grep -i instanceId |awk '{print $4}')

        for i in $kafka_instance_ids; 
        do
                echo "
                aws ec2 stop-instances --instance-ids $i
                "
        done
}


start_servers(){                       
                                      
        PROJECT="kafka"               
        kafka_instance_ids=$(aws ec2 describe-instances --filters "Name=tag:$PROJECT,Values=*" |grep -i instanceId |awk '{print $4}')
                                                                                                                                     
        for i in $kafka_instance_ids;                                                                                                
        do                                                                                                                           
                echo "
                aws ec2 start-instances --instance-ids $i                                                                             
                "
        done                                                                                                                         
}     
