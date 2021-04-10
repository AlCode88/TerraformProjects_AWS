# WHAT IS THE INFRASTRUCTURE AS A CODE ✅ 🧑‍💻
 * You **`write`** and **`execute`** the code to **`define, deploy, update,`** and **`destroy`** your infrastructure
 * Infrastructure as Code (IaC) is the **`managing`** and **`provisioning of infrastructure through code`** instead of through manual processes.
 *  Infrastructure as code is the **`process of managing and provisioning computer data centers through machine-readable definition files,`** rather than physical hardware configuration or interactive configuration tools.
 * With IaC, configuration files are created that **`contain your infrastructure specifications,`** which makes it easier to edit and distribute configurations.
 * It **`ensures that you provision the same environment`** every time.
 * By codifying and documenting your configuration specifications, IaC aids configuration management and helps you to avoid undocumented, ad-hoc configuration changes.
 
 **<ins>Link to the Source</ins>**
 <br>➡️  1.[HashiCorp](https://www.terraform.io/)
 <br>➡️  2.[YouTube.com](https://www.youtube.com/watch?v=POPP2WTJ8es&ab_channel=TechWorldwithNana)
 <br>➡️  3.[Medium.com](https://medium.com/bb-tutorials-and-thoughts/250-practice-questions-for-terraform-associate-certification-7a3ccebe6a1a)
 <br>➡️  4.[RedHat.com](https://www.redhat.com/en/topics/automation/)
 <br>➡️  5.[Stackify.com](https://stackify.com/what-is-infrastructure-as-code-how-it-works-best-practices-tutorials/)


# WHAT IS THE DIFFERENCE BETWEEN MUTABLE INFRASTRUCTURE AND IMMUTABLE INFRASTRUCTURE ✅
🧑‍💻
## IMMUTABLE INFRASTRUCTURE
<br> *Definition of `MUTABLE`
<br> 1. prone to change : inconstant
<br> 2. a: capable of change or of being changed; b: capable of or liable to mutation

**<ins>`Mutable infrastructure`</ins>** is infrastructure that can be modified or updated after it is originally provisioned. Mutable infrastructure gives development teams the flexibility to make ad hoc server customizations to, say, more closely fit development or application requirements or respond to an emergent security issue. But, it also undermines a key IaC benefit—the ability to maintain consistency between deployments or within versions—and can make infrastructure version tracking much more difficult.

## MUTABLE INFRASTRUCTURE
<br> *Definition of `IMMUTABLE`
<br> 1. not capable of or susceptible to change 

For these reasons, most IaC is implemented as **<ins>`Immutable infrastructure`</ins>**—infrastructure that cannot be modified once originally provisioned. If immutable infrastructure needs to be changed, it has to be replaced with new infrastructure. Because new infrastructure can be spun up quickly on the cloud—particularly with IaC—immutable infrastructure is much more feasible and practical than it sounds.

**<ins>Link to the Source</ins>**
<br>➡️  1.[www.hashicorp.com](https://www.hashicorp.com/resources/what-is-mutable-vs-immutable-infrastructure)
<br>➡️  2. A very good explanation available on [YouTube](https://www.youtube.com/watch?v=5qQQ3yzbKp8&ab_channel=CoreySchafer)

# WHAT IS THE DIFFERENCE BETWEEN IMPERATIVE AND DECLARATIVE APPROACH ✅ 🧑‍💻
##  IMPERATIVE OR PROCEDURAL APPROACH 
- Type of programming paradigm that describes how the program executes.
- You are more concerned with how to get an answer step by step.
- It is consist of step by step solutions to get the final or desired result.
- The order of execution is very important and uses both mutable and immutable.
- Good Example is Ansible where you have to define step by step solutions to get the final result. 

**EXAMPLE:**
```
To install apache on CentOS it is important to give exact steps or it will fail

1.       - name: Install httpd on CentOS
2.         yum:
3.          name: httpd
4.          state: present
```
##  DECLARATIVE APPROACH 
- You just giving the desired state without really specifying the steps that needs to be taken. 
- Declaraion without order to get the final result.
- Good example is Terraform

**EXAMPLE:**
```
To install apache on CentOS it is not important to give exact steps to achive the desired state. It will succeed.

2.         yum:
4.          state: present
1.       - name: Install httpd on CentOS
3.          name: httpd
```
**<ins>Link to the Source</ins>**
<br>➡️  1.A good example is here [YouTube.com](https://www.youtube.com/watch?v=yOBBkIJBEL8&ab_channel=TadasPetra)
<br>➡️  2.[geeksforgeeks.org](https://www.geeksforgeeks.org/difference-between-imperative-and-declarative-programming/)
[title](https://www.example.com)

# WHAT IS IDEMPOTANCE ✅ 🧑‍💻
- The idempotent characteristic provided by IaC tools ensures that, even if the same code is applied multiple times, the result remains the same.

**<ins>Link to the Source</ins>**
 <br>➡️  1. [YouTube](https://www.youtube.com/watch?v=UaKZ4wKytcA&ab_channel=CoreySchafer)
<br>➡️   2. [Medium.com](https://medium.com/bb-tutorials-and-thoughts/250-practice-questions-for-terraform-associate-certification-7a3ccebe6a1a)