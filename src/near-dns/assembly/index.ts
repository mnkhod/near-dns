@nearBindgen
export class Contract {
  private domainBox = new Map<string,string>();

  getDomain(domainName: string): string {
    if(this.domainBox.has(domainName)) {
      return "Already has that domain";
    }

    try{
      let domain = this.domainBox.get(domainName);
      return domain;
    }catch(e){
      return `Something Happened - ${e.message}`;
    }
  }

  setDomain(domainName: string,domainIPAddress: string): string {
    if(this.domainBox.has(domainName)) {
      return "Already has that domain";
    }

    try{
      this.domainBox.set(domainName,domainIPAddress);
      return `Added ${domainName} to ${domainIPAddress} address`;
    }catch(e){
      return `Something Happened - ${e.message}`;
    }
  }
}

