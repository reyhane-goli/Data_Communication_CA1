function c=my_Lloyds(v,b,N)
k=2^b;
x=(sqrt(v)).*randn(1,N);
u=datasample(x,k,'Replace',false);
new_u=zeros(size(u));
x=sort(x);
flag=0;

while (u~=new_u)
  if(flag==1)
      u=new_u;
  end
  if(flag==0)
     flag=1;
  end
  
  u=sort(u);
  
  for i=1:k-1
      s(1,i)=(u(1,i)+u(1,i+1))/2;
  end
  
  B=find(x<s(1,1));
  w=zeros(size(B));
  for i=1:1:length(B)
      w(1,i)=x(1,B(1,i));
  end
  y=repmat(w,[length(w),1]);
  z=y';
  r=sum((y-z).^2,2);
  [~,min_index]=min(r);
  new_u(1,1)=w(1,min_index);
  
  for i=2:k-1
      B=find(s(1,i-1)<x & x<s(1,i));
      w=zeros(size(B));
      for j=1:1:length(B)
        w(1,j)=x(1,B(1,j));
      end
      y=repmat(w,[length(w),1]);
      z=y';
      r=sum((y-z).^2,2);
      [~,min_index]=min(r);
      new_u(1,i)=w(1,min_index);
  end
  
  B=find(x>s(1,k-1));
  w=zeros(size(B));
  for i=1:1:length(B)
      w(1,i)=x(1,B(1,i));
  end
  y=repmat(w,[length(w),1]);
  z=y';
  r=sum((y-z).^2,2);
  [~,min_index]=min(r);
  new_u(1,k)=w(1,min_index);
end

%t=linspace(-3.3*v,3.3*v,N);
h=(1/sqrt(2*pi*v))*(exp(-(x.^2)/(2*(v))));
plot(x,h,'linewidth',3,'color','k')
%plot(t,x)
%axis([-4*v 4*v 0 7*v])

 n1=zeros(size(u));
% n2=zeros(size(s));
text(u,n1,'*','Color','r','FontWeight','Bold')
% hold on
% text(s,n2,'|')

hold on
for i=1:length(s)
    t=s(1,i)*ones(1,N);
    plot(t,h,'linewidth',0.001,'color','b')
end

e=s
f=u
    
%   l=[1 6 5 7 8 3]
%   r=[1 2 3 4 5 6 7 8 9]
%   p=find(r>l(1,3)& r<l(1,5))
%   w=zeros(size(p));
%     for i=1:1:size(p)+1
%       q=p(1,i)
%       w(1,i)=r(1,q)
%      end
end
  
 
     