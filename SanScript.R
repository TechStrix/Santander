

sandata1<-read.csv("E:/Kaggle Competitions/San/train.csv")

df_sandata = as.data.frame(sandata1)

san_hypo<-glm(TARGET~.,data = df_sandata)

san_test<-read.csv("E:/Kaggle Competitions/San/test.csv")

san_test1<-as.data.frame(san_test)

san_pred10<-predict(san_hypo, san_test1)



for (i in 1:length(san_pred10))
{
	if (san_pred10[i]<0)
	{
		san_pred10[i]<-1
	}
	else if(san_pred10[i]>=0)
	{
 		san_pred10[i]<-0
	}
}

san_pred10<-as.matrix(san_pred10)
san_id<-as.matrix(san_test1[,'ID'])

san1<-cbind(san_id,san_pred10)

write.csv(san1,"E:/Kaggle Competitions/San/finalsubmission1.csv")

head(rbind(san_test1[,'ID'],san_pred))

----------------------------------------------------------------------------------------------
san_hypo5<-glm(TARGET~ var3+var15+ind_var8+ind_var30_0 +ind_var30+num_var5+num_var42+saldo_var5+var36+delta_imp_reemb_var17_1y3+num_var22_ult1+num_meses_var5_ult3+ num_op_var41_efect_ult3+num_reemb_var17_ult1+var38,data = df_sandata)       

df_san_test1<-as.data.frame(san_test1)

san_pred6<-predict(san_hypo5, df_san_test1)


for (i in 1:length(san_pred6))
{
	if (san_pred6[i]<0)
	{
		san_pred6[i]<-0
	}
	else if(san_pred6[i]>=0)
	{
 		san_pred6[i]<-1
	}
}

san_pred6<-as.matrix(san_pred6)
san_id<-as.matrix(san_test1[,'ID'])

san2<-(cbind(san_id,san_pred6))

san3<-(cbind(san_id,san_pred6))

write.csv(san3,"E:/Kaggle Competitions/San/fin_sub_small_feature_3.csv")

